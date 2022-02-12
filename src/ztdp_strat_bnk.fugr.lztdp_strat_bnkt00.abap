*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 12.02.2022 at 08:13:40
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTDP_STRAT_BNK..................................*
DATA:  BEGIN OF STATUS_ZTDP_STRAT_BNK                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTDP_STRAT_BNK                .
CONTROLS: TCTRL_ZTDP_STRAT_BNK
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTDP_STRAT_BNK                .
TABLES: ZTDP_STRAT_BNK                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
