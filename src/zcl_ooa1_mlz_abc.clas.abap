CLASS zcl_ooa1_mlz_abc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_ooa1_mlz_hedef_sistem.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ooa1_mlz_abc IMPLEMENTATION.
  METHOD zif_ooa1_mlz_hedef_sistem~baglanti_testi_yap.
    ##todo.
    data dummy type zcl_ooa1_dummy=>dummy.
  ENDMETHOD.

  METHOD zif_ooa1_mlz_hedef_sistem~malzeme_gonder.
    ##todo.
    write 'ABCye malzeme gönderildi'.
  ENDMETHOD.

ENDCLASS.
