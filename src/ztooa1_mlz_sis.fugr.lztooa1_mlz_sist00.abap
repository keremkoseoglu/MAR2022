*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 29.01.2022 at 08:51:00
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZTOOA1_MLZ_SIS..................................*
DATA:  BEGIN OF STATUS_ZTOOA1_MLZ_SIS                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTOOA1_MLZ_SIS                .
CONTROLS: TCTRL_ZTOOA1_MLZ_SIS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTOOA1_MLZ_SIS                .
TABLES: ZTOOA1_MLZ_SIS                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
