*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZTOOA1_MLZ_SIS
*   generation date: 29.01.2022 at 08:50:59
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZTOOA1_MLZ_SIS     .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
