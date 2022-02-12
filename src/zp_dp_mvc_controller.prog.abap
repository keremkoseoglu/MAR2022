REPORT zp_dp_mvc_controller.

tables sflight.

select-options: s_Carrid for sflight-carrid,
                s_connid for sflight-connid,
                s_fldate for sflight-fldate.

start-of-selection.
  data(model) = new zcl_dp_mvc_model(
                        value #( carrid_rng = s_carrid[]
                                 connid_rng = s_connid[]
                                 fldate_rng = s_Fldate[] ) ).

  data(alv_data) = model->flights.
  cl_demo_output=>display_data( alv_data ).
