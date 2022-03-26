*&---------------------------------------------------------------------*
*& Report zp_amdp_tab_fun
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_amdp_tab_fun.

START-OF-SELECTION.
  SELECT * FROM zi_amdp_tab_fun_np( )
           INTO TABLE @DATA(tf_sonuclar).

  cl_demo_output=>display_data( tf_sonuclar ).

  SELECT * FROM zi_amdp_tab_fun_cagir
           INTO TABLE @DATA(cds_sonuclar).

  cl_demo_output=>display_data( cds_sonuclar ).
