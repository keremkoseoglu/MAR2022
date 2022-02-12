CLASS zcl_dp_deco_kontrol3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_dp_deco_kontrol.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_deco_kontrol3 IMPLEMENTATION.
  METHOD zif_dp_deco_kontrol~kontrol_et.
    ##todo. " Burası değişecek

    IF strlen( veri ) < 3.
      basarili  = abap_false.
      sonuc_msg = 'Kontrol 3: Deger 3ten kucuk'.
    ELSE.
      basarili  = abap_True.
      sonuc_msg = 'Kontrol 3 basarili'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
