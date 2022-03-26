REPORT zp_amdp_hello_world.

START-OF-SELECTION.
  zcl_amdp_hello_World=>get_flights(
    EXPORTING mandt   = sy-mandt
    IMPORTING flights = DATA(flights) ).

  cl_demo_output=>display_data( flights ).
