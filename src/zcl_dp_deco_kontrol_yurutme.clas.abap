CLASS zcl_dp_deco_kontrol_yurutme DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: sonuc_list TYPE STANDARD TABLE OF text50 WITH EMPTY KEY.

    METHODS tum_kontrolleri_yurut
      IMPORTING !veri     TYPE char15
      EXPORTING !basarili TYPE abap_bool
                !sonuclar TYPE sonuc_list.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_deco_kontrol_yurutme IMPLEMENTATION.
  METHOD tum_kontrolleri_yurut.
    DATA obj TYPE REF TO object.

    basarili = abap_True.

    SELECT clsname FROM seometarel
           WHERE refclsname = 'ZIF_DP_DECO_KONTROL'
           INTO TABLE @DATA(siniflar).

    LOOP AT siniflar ASSIGNING FIELD-SYMBOL(<snf>).
      CREATE OBJECT obj TYPE (<snf>-clsname).
      DATA(decorator) = CAST zif_dp_deco_kontrol( obj ). " ?=

      decorator->kontrol_et(
        EXPORTING veri      = veri
        IMPORTING basarili  = DATA(deco_basarili)
                  sonuc_msg = DATA(deco_sonuc_msg) ).

      IF deco_basarili = abap_False.
        basarili = abap_False.
      ENDIF.

      APPEND deco_sonuc_msg TO sonuclar.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
