CLASS zcl_dp_strat_tc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_dp_Strat_banka.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_strat_tc IMPLEMENTATION.
  METHOD zif_dp_strat_banka~kurlari_al.
    ##todo. " XML'den kurları elde et
    result = 'TC kurlari okundu'.
  ENDMETHOD.

ENDCLASS.
