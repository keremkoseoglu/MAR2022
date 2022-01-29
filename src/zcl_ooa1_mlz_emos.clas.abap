CLASS zcl_ooa1_mlz_emos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_ooa1_mlz_bld_sistem.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ooa1_mlz_emos IMPLEMENTATION.
  METHOD zif_ooa1_mlz_hedef_sistem~baglanti_testi_yap.
    ##todo. " geçici kod
    write: 'EMOS testi OK'.
  ENDMETHOD.

  METHOD zif_ooa1_mlz_bildirim~bildirim_gonder.
    ##todo. " geçici kod
    write: 'EMOS bildirim OK'.
  ENDMETHOD.

  METHOD zif_ooa1_mlz_hedef_sistem~malzeme_gonder.
    ##todo. " geçici kod
    write: 'EMOS gönderim OK'.
  ENDMETHOD.

ENDCLASS.
