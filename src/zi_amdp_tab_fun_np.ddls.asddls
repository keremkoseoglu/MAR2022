@EndUserText.label: 'Parametresiz Table Function'
define table function ZI_AMDP_TAB_FUN_NP
  with parameters
    @Environment.systemField: #CLIENT
    p_client : abap.clnt
returns
{
  mandt  : abap.clnt;
  carrid : s_carr_id;
  connid : s_conn_id;
  fldate : s_date;
}
implemented by method
  zcl_amdp_tab_fun_np=>execute2;