CLASS zcl_dp_vis_log DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces ZIF_DP_VISITOR.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_vis_log IMPLEMENTATION.
  METHOD zif_dp_visitor~visit.
    ##todo. " Burada log yazılacak
    new-line.
    write 'Log yazıldı'.
  ENDMETHOD.
ENDCLASS.
