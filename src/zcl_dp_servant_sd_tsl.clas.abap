CLASS zcl_dp_servant_sd_tsl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_dp_servant_uygulayan.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_servant_sd_tsl IMPLEMENTATION.
  METHOD zif_dp_servant_uygulayan~gercek_kayit.
    NEW-LINE.
    WRITE 'SD tsl kaydı atıldı'.
  ENDMETHOD.

  METHOD zif_dp_servant_uygulayan~json_parse_et.
    NEW-LINE.
    WRITE 'SD tsl JSON parse edildi'.
  ENDMETHOD.

  METHOD zif_dp_servant_uygulayan~simulasyon.
    NEW-LINE.
    WRITE 'SD tsl simüle edildi'.
  ENDMETHOD.

  METHOD zif_dp_servant_uygulayan~veri_kontrolu.
    TRY.
        RAISE EXCEPTION TYPE zcx_ec_tablo_bos
          EXPORTING
            textid  = zcx_ec_tablo_bos=>bu_sene_bos
            tabname = 'ZTABLOM'.

      CATCH cx_root INTO DATA(genel_Hata).
        RAISE EXCEPTION TYPE zcx_ec_veri_kontrol
          EXPORTING
            textid   = zcx_ec_veri_kontrol=>basarisiz
            previous = genel_hata.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
