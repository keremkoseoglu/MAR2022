CLASS zcl_dp_deco_kontrol2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_dp_deco_kontrol.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_deco_kontrol2 IMPLEMENTATION.
  METHOD zif_dp_deco_kontrol~kontrol_et.
    ##todo. " Burası değişecek
    basarili  = abap_True.
    sonuc_msg = 'Kontrol 2 basarili'.
  ENDMETHOD.
ENDCLASS.
