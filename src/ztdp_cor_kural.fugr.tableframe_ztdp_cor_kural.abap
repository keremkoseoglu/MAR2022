*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZTDP_COR_KURAL
*   generation date: 12.02.2022 at 10:47:26
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZTDP_COR_KURAL     .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
