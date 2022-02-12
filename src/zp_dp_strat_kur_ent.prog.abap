REPORT zp_dp_strat_kur_ent.

PARAMETERS: p_bnkid TYPE ztdp_strat_bnk-bnkid.

START-OF-SELECTION.
  NEW zcl_sd_strat_kur_ent( )->entegre_et(
    EXPORTING bnkid        = p_bnkid
    IMPORTING okuma_sonucu = DATA(oson)
              yazma_sonucu = DATA(yson) ).

  NEW-LINE.
  WRITE oson.
  NEW-LINE.
  WRITE yson.
