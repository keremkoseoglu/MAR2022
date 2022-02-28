*&---------------------------------------------------------------------*
*& Report zp_dp_singleton
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_dp_singleton.

start-of-selection.
  data(servis)  = new zcl_dp_singleton_servis_cagir( ).
  data(siparis) = new zcl_dp_singleton_sd_siparis( ).

  servis->cagir( ).
  siparis->siparis_yarat( ).
