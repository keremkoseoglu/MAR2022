INTERFACE zif_dp_deco_kontrol
  PUBLIC .

  METHODS kontrol_et
    IMPORTING !veri      TYPE char15
    EXPORTING !basarili  TYPE abap_bool
              !sonuc_msg TYPE text50.

ENDINTERFACE.
