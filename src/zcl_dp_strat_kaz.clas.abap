CLASS zcl_dp_strat_kaz DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_dp_Strat_banka.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_strat_kaz IMPLEMENTATION.
  METHOD zif_dp_strat_banka~kurlari_al.
    ##todo. " HTML'den kurları elde et
    result = 'Kazakistan kurlari okundu'.
  ENDMETHOD.
ENDCLASS.
