CLASS zcl_dp_servant_merkez DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS guvenli_kayit_at
      IMPORTING !gelen_json TYPE string
                !uygulayan  TYPE REF TO zif_dp_servant_uygulayan
      EXPORTING !donen_json TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS log_ac.
    METHODS log_kapat.
    METHODS log_ek IMPORTING !text TYPE clike.
    METHODS yetkiye_bak.

    METHODS en_derin_hatayi_al
      IMPORTING !hata         TYPE REF TO cx_root
      RETURNING VALUE(result) TYPE REF TO cx_root.
ENDCLASS.



CLASS zcl_dp_servant_merkez IMPLEMENTATION.
  METHOD guvenli_kayit_at.
    TRY.
        IF gelen_json IS INITIAL.
          ##todo. " hata türet
        ENDIF.

        log_ac( ).

        log_ek( 'JSON parse ediliyor' ).
        uygulayan->json_parse_et( gelen_json ).

        log_ek( 'Veri kontrolü yapılıyor' ).
        uygulayan->veri_kontrolu( ).

        log_ek( 'Simülasyon yapılıyor' ).
        uygulayan->simulasyon( ).

        log_ek( 'Yetki kontrolü yapılıyor' ).
        yetkiye_bak( ).

        log_ek( 'Gerçek kayıt yapılıyor' ).
        uygulayan->gercek_kayit( ).

        log_ek( 'Kayıtlar başarılı, iş bitti' ).
        donen_json = '{ "success": true, "msg": "" }'.
        log_kapat( ).

      CATCH cx_root INTO DATA(genel_hata).
        data(derin_hata) = en_derin_hatayi_al( genel_hata ).
        log_ek( derin_hata->get_Text( ) ).
        log_kapat( ).

        donen_json = |\{ "success": false, "msg": "{ derin_hata->get_Text( ) }" \}|.

        ##todo.
        " Z'li tablodan ilgili kişileri bulup mail at
        " saat mesai dışı ise, basis'e sms at ;)
    ENDTRY.
  ENDMETHOD.


  METHOD log_ac.
    ##todo. " düzelt
    NEW-LINE.
    WRITE 'Log açıldı'.
  ENDMETHOD.


  METHOD log_kapat.
    ##todo. " düzelt
    NEW-LINE.
    WRITE 'Log kapatıldı'.
  ENDMETHOD.


  METHOD log_ek.
    ##todo. " düzelt
    NEW-LINE.
    WRITE text.
  ENDMETHOD.


  METHOD yetkiye_bak.
    ##todo. " düzelt
    NEW-LINE.
    WRITE 'Yetkiye bakıldı, yetki var'.
  ENDMETHOD.


  METHOD en_derin_hatayi_al.
    result = COND #( WHEN hata->previous IS INITIAL
                     THEN hata
                     ELSE en_derin_Hatayi_al( hata->previous ) ).
  ENDMETHOD.
ENDCLASS.
