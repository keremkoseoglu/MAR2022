CLASS zcl_dp_strat_kur_kayit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    methods execute
      importing !kurlar type string
      returning value(result) type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_strat_kur_kayit IMPLEMENTATION.
  method execute.
    ##todo. " Burada BAPI filan çağırılacak normalde
    result = 'Kurlar kaydedildi'.
  endmethod.
ENDCLASS.
