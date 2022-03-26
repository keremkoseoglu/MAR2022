REPORT zp_amdp_parametre.
TABLES sflight.

SELECT-OPTIONS: s_carrid FOR sflight-carrid,
                s_connid FOR sflight-connid,
                s_fldate FOR sflight-fldate.

START-OF-SELECTION.
  " 1) SEL.SCR -> STRING """"""""""""""""""""""""""""""""""""""""""""
  DATA(filter) = cl_shdb_seltab=>combine_seltabs(
                     VALUE #( ( name = 'CARRID'
                                dref = REF #( s_carrid[] ) )
                              ( name = 'CONNID'
                                dref = REF #( s_connid[] ) )
                              ( name = 'FLDATE'
                                dref = REF #( s_fldate[] ) ) ) ).

  " 2) AMDP çağır """""""""""""""""""""""""""""""""""""""""""""""""""
  zcl_amdp_parametre=>get_sel_scr_flights(
    EXPORTING mandt         = sy-mandt
              flight_filter = filter
    IMPORTING flights       = DATA(flights) ).

  " 3) Göster """""""""""""""""""""""""""""""""""""""""""""""""""""""
  cl_demo_output=>display_data( flights ).
