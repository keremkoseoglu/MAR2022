INTERFACE zif_dp_servant_uygulayan
  PUBLIC .

  methods json_parse_et importing !gelen_json type string.
  METHODS veri_kontrolu RAISING zcx_ec_veri_kontrol.
  METHODS simulasyon RAISING zcx_ec_kayit_hatasi.
  METHODS gercek_kayit RAISING zcx_ec_kayit_hatasi.
ENDINTERFACE.
