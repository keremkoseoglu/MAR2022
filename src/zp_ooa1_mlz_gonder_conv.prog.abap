REPORT zp_ooa1_mlz_gonder_conv.

DATA obj TYPE REF TO object.
PARAMETERS: p_sistem TYPE char5.

START-OF-SELECTION.
  DATA(clsname) = |ZCL_OOA1_MLZ_{ p_sistem }|.
  CREATE OBJECT obj TYPE (clsname).
  DATA(usb) = CAST zif_ooa1_mlz_bildirim( obj ).

  ##todo.
