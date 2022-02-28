CLASS zcl_ec_model1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS kayit_at
      RAISING zcx_ec_veri_kontrol
              zcx_ec_kayit_hatasi.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS veri_kontrolu RAISING zcx_ec_veri_kontrol.

    METHODS simulasyon_yap.
    METHODS bapi_cagir RAISING zcx_ec_kayit_hatasi.

    METHODS veri_kontrolu_1 RAISING zcx_ec_tablo_bos.
    METHODS veri_kontrolu_2 RAISING zcx_ec_veri_hatasi.
ENDCLASS.



CLASS zcl_ec_model1 IMPLEMENTATION.
  METHOD kayit_at.
    veri_kontrolu( ).
    simulasyon_yap( ).
    bapi_cagir( ).
  ENDMETHOD.


  METHOD veri_kontrolu.
    TRY.
        veri_kontrolu_1( ).
        veri_kontrolu_2( ).

      CATCH cx_root INTO DATA(genel_hata).
        RAISE EXCEPTION TYPE zcx_ec_veri_kontrol
          EXPORTING
            textid   = zcx_ec_veri_kontrol=>basarisiz
            previous = genel_hata.
    ENDTRY.
  ENDMETHOD.


  METHOD veri_kontrolu_1.
    ##todo.
    " if falan filan...
    RAISE EXCEPTION TYPE zcx_ec_tablo_bos
      EXPORTING
        textid  = zcx_ec_tablo_bos=>bu_sene_bos
        tabname = 'ZTABLOM'.
    " endif
  ENDMETHOD.


  METHOD veri_kontrolu_2.
    ##todo.
    RAISE EXCEPTION TYPE zcx_ec_veri_hatasi
      EXPORTING
        textid = zcx_ec_veri_hatasi=>malzeme_tanimsiz
        matnr  = '0001'.
  ENDMETHOD.


  METHOD simulasyon_yap.
    ##todo.
    " new zcl_simulasyon( )->execute( ).
  ENDMETHOD.


  METHOD bapi_cagir.
    ##todo.
    RAISE EXCEPTION TYPE zcx_ec_kayit_hatasi
      EXPORTING
        textid = zcx_ec_kayit_hatasi=>auth_error.
  ENDMETHOD.
ENDCLASS.
