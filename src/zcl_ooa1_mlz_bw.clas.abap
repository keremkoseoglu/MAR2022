CLASS zcl_ooa1_mlz_bw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  ##todo.
  " aşağıyı tamamla
  " zp_ooa1_mlz_gonderimi devam etsin

  PUBLIC SECTION.
    INTERFACES zif_ooa1_mlz_hedef_sistem.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ooa1_mlz_bw IMPLEMENTATION.
  METHOD zif_ooa1_mlz_hedef_sistem~baglanti_testi_yap.
    ##todo. " burada test yap, aşağıdaki kod geçicidir
    basari   = abap_true.
    hata_msg = space.
  ENDMETHOD.

  METHOD zif_ooa1_mlz_hedef_sistem~malzeme_gonder.
    ##todo.
    " Burada gerçekten malzeme gönder
    " Malzeme gönderemediysen başarısız de
    basari = abap_true.
  ENDMETHOD.

  METHOD zif_ooa1_mlz_hedef_sistem~live_cache.
    ##todo. " geçici kod
    WRITE 'BW Live Cache etkinleşti'.
  ENDMETHOD.

ENDCLASS.
