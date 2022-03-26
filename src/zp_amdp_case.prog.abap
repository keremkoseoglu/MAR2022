REPORT zp_amdp_case.

START-OF-SELECTION.
  zcl_amdp_case=>get_customer_levels(
    EXPORTING mandt  = sy-mandt
    IMPORTING levels = DATA(levels) ).

  cl_demo_output=>display_data( levels ).
