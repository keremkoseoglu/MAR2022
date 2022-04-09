CLASS lhc_Flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Flight RESULT result.

    METHODS acceptFlight FOR MODIFY
      IMPORTING keys FOR ACTION Flight~acceptFlight RESULT result.

    METHODS rejectFlight FOR MODIFY
      IMPORTING keys FOR ACTION Flight~rejectFlight RESULT result.

    METHODS setSeatsMax FOR DETERMINE ON SAVE
      IMPORTING keys FOR Flight~setSeatsMax.

    METHODS validateCurrency FOR VALIDATE ON SAVE
      IMPORTING keys FOR Flight~validateCurrency.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Flight RESULT result.

ENDCLASS.

CLASS lhc_Flight IMPLEMENTATION.

  METHOD get_instance_features.
    " Buton gözüksün mü?
    READ ENTITIES OF zi_rap_flight
         IN LOCAL MODE
         ENTITY Flight
         FIELDS ( status ) WITH CORRESPONDING #( keys )
         RESULT DATA(flights)
         FAILED failed.

    result = VALUE #( FOR _flight IN flights
                      LET accept_enable = COND #( WHEN _flight-status = 1
                                                  THEN if_abap_behv=>fc-o-disabled
                                                  ELSE if_abap_behv=>fc-o-enabled )
                          reject_enable = COND #( WHEN _flight-status <> 1
                                                  THEN if_abap_behv=>fc-o-disabled
                                                  ELSE if_abap_behv=>fc-o-enabled )
                      IN ( %tky                 = _flight-%tky
                           %action-acceptFlight = accept_enable
                           %action-rejectFlight = reject_enable ) ).
  ENDMETHOD.


  METHOD acceptFlight.
    " Yeni statü ata
    MODIFY ENTITIES OF zi_rap_flight
           IN LOCAL MODE
           ENTITY Flight
           UPDATE FIELDS ( status )
           WITH VALUE #( FOR _key IN keys
                         ( %tky   = _key-%tky
                           status = 1 ) )
           FAILED failed
           REPORTED reported.

    " Güncellenmiş verileri geri döndür
    READ ENTITIES OF zi_rap_flight
         IN LOCAL MODE
         ENTITY Flight
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(flights).

    result = VALUE #( FOR _flight IN flights
                      ( %tky   = _flight-%tky
                        %param = _flight ) ).
  ENDMETHOD.


  METHOD rejectFlight.
    " Yeni statü ata
    MODIFY ENTITIES OF zi_rap_flight
           IN LOCAL MODE
           ENTITY Flight
           UPDATE FIELDS ( status )
           WITH VALUE #( FOR _key IN keys
                         ( %tky   = _key-%tky
                           status = 0 ) )
           FAILED failed
           REPORTED reported.

    " Güncellenmiş verileri geri döndür
    READ ENTITIES OF zi_rap_flight
         IN LOCAL MODE
         ENTITY Flight
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(flights).

    result = VALUE #( FOR _flight IN flights
                      ( %tky   = _flight-%tky
                        %param = _flight ) ).
  ENDMETHOD.


  METHOD setSeatsMax.
    " Uçuşu oku
    READ ENTITIES OF zi_rap_flight
         IN LOCAL MODE
         ENTITY flight
         FIELDS ( seatsmax ) WITH CORRESPONDING #( keys )
         RESULT DATA(flights).

    " Seatsmax zaten dolu ise, işimiz yok
    DELETE flights WHERE seatsmax IS NOT INITIAL.
    IF flights IS INITIAL.
      RETURN.
    ENDIF.

    " Boşlara değer yaz
    MODIFY ENTITIES OF zi_rap_flight
           IN LOCAL MODE
           ENTITY flight
           UPDATE FIELDS ( seatsmax )
           WITH VALUE #( FOR _flight IN flights
                         ( %tky     = _flight-%tky
                           seatsmax = 99 ) )
           REPORTED DATA(flight_reported).

    " Güncellenmiş değerleri ekrana geri döndür
    reported = CORRESPONDING #( DEEP flight_reported ).
  ENDMETHOD.


  METHOD validateCurrency.
    " Ekrandaki değerleri al
    READ ENTITIES OF zi_rap_flight
         IN LOCAL MODE
         ENTITY Flight
         FIELDS ( currency ) WITH CORRESPONDING #( keys )
         RESULT DATA(flights).

    " Validasyon
    LOOP AT flights ASSIGNING FIELD-SYMBOL(<flight>).
      IF <flight>-currency <> 'USD' AND <flight>-currency <> 'EUR'.
        append value #( %tky = <flight>-%tky ) to failed-flight.

        data(msg) = new zcm_rap_flight(
                            severity  = if_abap_behv_message=>severity-error
                            textid    = zcm_rap_flight=>field_invalid
                            fieldname = 'CURRENCY' ).

        append value #( %tky        = <flight>-%tky
                        %state_area = 'VALIDATECURRENCY'
                        %msg        = msg
                      ) to reported-flight.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD get_instance_authorizations.
    " Ekrandaki veriyi oku
    read entities of zi_rap_flight
         in local mode
         entity Flight
         fields ( status ) with corresponding #( keys )
         result data(flights)
         failed failed.

    if flights is initial.
    return.
    endif.

    " Veritabanından önceki halini oku
    select from sflight
           fields carrid, connid, fldate, seatsmax_b as status
           for all entries in @flights
           where carrid = @flights-carrid and
                 connid = @flights-connid and
                 fldate = @flights-fldate
           order by primary key
           into table @data(flights_db).

    " Kullanıcı ne yapmak istedi?
    data(guncelleme_var) =
      xsdbool( requested_authorizations-%update              = if_abap_Behv=>mk-on or
               requested_authorizations-%delete              = if_abap_Behv=>mk-on or
               requested_authorizations-%action-acceptFlight = if_abap_Behv=>mk-on or
               requested_authorizations-%action-rejectFlight = if_abap_Behv=>mk-on ).

    data(silme_var) =
      xsdbool( requested_authorizations-%delete              = if_abap_Behv=>mk-on ).

    " Yetki kontrolü
    loop at flights assigning field-symbol(<flight>).
      assign flights_db[ carrid = <flight>-carrid
                         connid = <flight>-connid
                         fldate = <flight>-fldate
                       ] to field-symbol(<flight_db>).

      data(onceden_var) = xsdbool( sy-subrc = 0 ).

      if guncelleme_var = Abap_true.
        if onceden_var = abap_true.
          ##todo. "authority-check 02
          data(guncelleyebilir) = abap_True.
        else.
          ##todo. "authority-check 01
          guncelleyebilir = abap_True.
        endif.
      endif.

      if guncelleyebilir = abap_False.
        append value #( %tky        = <flight>-%tky
                        %fail-cause = if_abap_Behv=>cause-unauthorized
                      ) to failed-flight.

        append value #( %tky        = <flight>-%tky
                        %msg        = new zcm_rap_flight( severity = if_Abap_behv_message=>severity-error
                                                          textid   = zcm_rap_flight=>no_auth )
                      ) to reported-flight.
      endif.

      if silme_var = abap_True.
      ##todo.
      endif.
    endloop.
  ENDMETHOD.

ENDCLASS.
