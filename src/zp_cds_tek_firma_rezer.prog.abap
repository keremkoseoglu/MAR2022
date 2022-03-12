*&---------------------------------------------------------------------*
*& Report zp_cds_tek_firma_rezer
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_cds_tek_firma_rezer.

PARAMETERS: p_car TYPE sbook-carrid,
            p_cty TYPE sbook-custtype.

SELECT * FROM zi_cds_tek_firma_rezer(
                 p_carrid = @p_car,
                 p_ctype  = @p_cty )
         INTO TABLE @DATA(rezervasyonlar).

cl_Demo_output=>display( rezervasyonlar ).
