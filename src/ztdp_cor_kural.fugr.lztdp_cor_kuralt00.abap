*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 12.02.2022 at 10:47:26
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTDP_COR_KURAL..................................*
DATA:  BEGIN OF STATUS_ZTDP_COR_KURAL                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTDP_COR_KURAL                .
CONTROLS: TCTRL_ZTDP_COR_KURAL
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTDP_COR_KURAL                .
TABLES: ZTDP_COR_KURAL                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
