REPORT zp_amdp_exception.

PARAMETERS p_carrid TYPE scarr-carrid.

START-OF-SELECTION.
  TRY.
      zcl_amdp_akis=>carrier_ucus_sayisi(
        EXPORTING mandt  = sy-mandt
                  carrid = p_carrid
        IMPORTING result = DATA(result) ).

      WRITE result.

    CATCH cx_root INTO DATA(hata).
      BREAK-POINT.
  ENDTRY.
