CLASS zcl_ooa1_mlz_apo DEFINITION
  INHERITING FROM zcl_ooa1_mlz_json_sistem
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: zif_ooa1_mlz_hedef_sistem~baglanti_testi_yap REDEFINITION.
  PROTECTED SECTION.
    METHODS: karsi_sisteme_gonder REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ooa1_mlz_apo IMPLEMENTATION.
  METHOD zif_ooa1_mlz_hedef_sistem~baglanti_testi_yap.
    ##todo. " Geçici kod
    WRITE: 'APO bağlantı testi başarılı'.
  ENDMETHOD.


  METHOD karsi_sisteme_gonder.
    ##todo. " Geçici kod
    WRITE: 'APO sistemine veri gitti'.
  ENDMETHOD.
ENDCLASS.
