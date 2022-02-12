CLASS zcl_dp_vis_mail_atma DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces ZIF_DP_VISITOR.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_vis_mail_atma IMPLEMENTATION.
  METHOD zif_dp_visitor~visit.
    ##todo. " Burada mail atılacak
    new-line.
    write 'Mail atıldı'.
  ENDMETHOD.

ENDCLASS.
