CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS setSmoker FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~setSmoker.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD setSmoker.
  ENDMETHOD.

ENDCLASS.