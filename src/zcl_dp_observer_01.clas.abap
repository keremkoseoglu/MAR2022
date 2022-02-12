CLASS zcl_dp_observer_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_dp_observer.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_observer_01 IMPLEMENTATION.
  METHOD zif_dp_observer~data_saved.
    new-line.
    write 'Observer 1 haberdar'.
    ##todo. " değiştir
  ENDMETHOD.

ENDCLASS.
