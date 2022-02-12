CLASS zcl_dp_strat_fas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_dp_Strat_banka.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_strat_fas IMPLEMENTATION.
  METHOD zif_dp_strat_banka~kurlari_al.
    ##todo. " HTML'den kurları elde et
    result = 'Fas kurlari okundu'.
  ENDMETHOD.

ENDCLASS.
