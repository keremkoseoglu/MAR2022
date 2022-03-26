CLASS zcl_amdp_tab_fun_np DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_amdp_marker_hdb.

    class-methods execute2 for table function ZI_AMDP_TAB_FUN_NP.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_tab_fun_np IMPLEMENTATION.
  method execute2
    by DATABASE function FOR HDB LANGUAGE SQLSCRIPT
    options read-only
    using sflight.

    tmp = select mandt, carrid, connid, fldate
          from sflight
          where mandt = :p_client;

    return select * from :tmp;

  endmethod.
ENDCLASS.
