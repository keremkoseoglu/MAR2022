CLASS zcl_dp_multiton_musteri DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    DATA: name1 TYPE char35 READ-ONLY,
          falan TYPE abap_bool READ-ONLY,
          filan TYPE abap_bool READ-ONLY,
          kunnr TYPE char10 READ-ONLY.

    CLASS-METHODS get_instance
      IMPORTING !kunnr        TYPE char10
                !bypass_cache TYPE abap_bool DEFAULT abap_false
      RETURNING VALUE(result) TYPE REF TO zcl_dp_multiton_musteri.

    CLASS-METHODS cachei_temizle.

    METHODS bloke_mi RETURNING VALUE(result) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF musteri_cache_dict,
             kunnr   TYPE char10,
             musteri TYPE REF TO zcl_dp_multiton_musteri,
           END OF musteri_cache_dict,

           musteri_Cache_set TYPE HASHED TABLE OF musteri_cache_Dict
                             WITH UNIQUE KEY primary_key COMPONENTS kunnr.

    CLASS-DATA musteri_Cache TYPE musteri_cache_Set.

    DATA: blokaja_Bakildi TYPE abap_bool,
          blokajli        TYPE abap_bool.

    METHODS constructor IMPORTING !kunnr TYPE char10.
ENDCLASS.



CLASS zcl_dp_multiton_musteri IMPLEMENTATION.
  METHOD get_instance.
    DATA(cache) = REF #( zcl_dp_multiton_musteri=>musteri_cache ).

    IF bypass_cache = abap_True.
      DELETE cache->* WHERE kunnr = kunnr.
    ENDIF.

    ASSIGN cache->*[ KEY primary_key COMPONENTS
                     kunnr = kunnr
                   ] TO FIELD-SYMBOL(<cache>).

    IF sy-subrc <> 0.
      DATA(new_cache) = VALUE musteri_Cache_dict( kunnr   = kunnr
                                                  musteri = NEW #( kunnr ) ).

      INSERT new_cache INTO TABLE cache->* ASSIGNING <cache>.
    ENDIF.

    result = <cache>-musteri.
  ENDMETHOD.


  METHOD cachei_temizle.
    CLEAR zcl_dp_multiton_musteri=>musteri_cache.
  ENDMETHOD.


  METHOD constructor.
    me->kunnr = kunnr.
    ##todo. " verileri gerçekten oku
    me->name1 = |{ kunnr } müşterisi|.
    me->falan = abap_true.
    me->filan = abap_true.
  ENDMETHOD.


  METHOD bloke_mi.
    IF me->blokaja_bakildi = abap_False.
      ##todo. " me->blokajlı dolacak
      me->blokaja_bakildi = abap_true.
    ENDIF.

    result = me->blokajli.
  ENDMETHOD.
ENDCLASS.
