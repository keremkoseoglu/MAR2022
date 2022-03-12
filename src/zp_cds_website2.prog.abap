*&---------------------------------------------------------------------*
*& Report zp_cds_website2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_cds_website2.

TABLES scarr.

SELECT-OPTIONS: s_Carrid FOR scarr-carrid.

SELECT * FROM zi_cds_website2
         WHERE carrid IN @s_carrid
         INTO TABLE @DATA(websites).

cl_demo_output=>display_data( websites ).
