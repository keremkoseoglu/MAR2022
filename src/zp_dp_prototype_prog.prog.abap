*&---------------------------------------------------------------------*
*& Report zp_dp_prototype_prog
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_dp_prototype_prog.

START-OF-SELECTION.
  PERFORM yavas.
  PERFORM hizli.


FORM yavas.
  DATA(o1) = NEW zcl_dp_prototype_mud(
                    matnr = 'A'
                    werks = 'B'
                    lgort = 'C' ).

  o1->calc_dy_stok( ).
  o1->calc_uy_stok( ).

  DATA(o2) = NEW zcl_dp_prototype_mud(
                    matnr = 'A'
                    werks = 'B'
                    lgort = 'D' ).

  o2->calc_dy_stok( ).
  o2->calc_uy_stok( ).
ENDFORM.


FORM hizli.
  DATA(o1) = NEW zcl_dp_prototype_mud(
                    matnr = 'A'
                    werks = 'B'
                    lgort = 'C' ).

  o1->calc_dy_stok( ).
  o1->calc_uy_stok( ).

  data(o2) = o1->clone( new_lgort = 'D' ).
ENDFORM.
