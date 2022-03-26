REPORT zp_amdp_fuzzy.

START-OF-SELECTION.
  "PERFORM exact.
  "PERFORM exact_london.
  "perform fuzzy.
  perform turkce_fuzzy.

FORM exact.
  zcl_amdp_fuzzy=>find_airports_exact(
    EXPORTING name_txt = 'HongKong'
    IMPORTING airports = DATA(airports1) ).

  cl_demo_output=>display_data(
    value = airports1
    name  = 'HongKong exact' ).

  zcl_amdp_fuzzy=>find_airports_exact(
    EXPORTING name_txt = 'HongKang'
    IMPORTING airports = DATA(airports2) ).

  cl_demo_output=>display_data(
    value = airports2
    name  = 'HongKang exact' ).

  zcl_amdp_fuzzy=>find_airports_exact(
    EXPORTING name_txt = 'hongkong'
    IMPORTING airports = DATA(airports3) ).

  cl_demo_output=>display_data(
    value = airports3
    name  = 'hongkong exact' ).
ENDFORM.


FORM exact_london.
  zcl_amdp_fuzzy=>find_airports_exact(
    EXPORTING name_txt = 'london'
    IMPORTING airports = DATA(airports4) ).

  cl_demo_output=>display_data(
    value = airports4
    name  = 'London exact' ).
ENDFORM.


form fuzzy.
  zcl_amdp_fuzzy=>find_airports_fuzzy(
    EXPORTING name_txt = 'HongKong'
    IMPORTING airports = DATA(airports1) ).

  cl_demo_output=>display_data(
    value = airports1
    name  = 'HongKong fuzzy' ).

  zcl_amdp_fuzzy=>find_airports_fuzzy(
    EXPORTING name_txt = 'HongKang'
    IMPORTING airports = DATA(airports2) ).

  cl_demo_output=>display_data(
    value = airports2
    name  = 'HongKang fuzzy' ).

  zcl_amdp_fuzzy=>find_airports_fuzzy(
    EXPORTING name_txt = 'hongkong'
    IMPORTING airports = DATA(airports3) ).

  cl_demo_output=>display_data(
    value = airports3
    name  = 'hongkong fuzzy' ).

  zcl_amdp_fuzzy=>find_airports_fuzzy(
    EXPORTING name_txt = 'london'
    IMPORTING airports = DATA(airports4) ).

  cl_demo_output=>display_data(
    value = airports4
    name  = 'London fuzzy' ).
endform.


form turkce_fuzzy.
  zcl_amdp_fuzzy=>find_airports_fuzzy(
    EXPORTING name_txt = 'malaysıa'
    IMPORTING airports = DATA(airports1) ).

  cl_demo_output=>display_data(
    value = airports1
    name  = 'malaysıa fuzzy' ).

  zcl_amdp_fuzzy=>find_airports_fuzzy(
    EXPORTING name_txt = 'CİTY'
    IMPORTING airports = DATA(airports2) ).

  cl_demo_output=>display_data(
    value = airports2
    name  = 'CİTY fuzzy' ).
endform.
