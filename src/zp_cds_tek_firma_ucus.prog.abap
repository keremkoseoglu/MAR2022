*&---------------------------------------------------------------------*
*& Report zp_cds_tek_firma_ucus
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_cds_tek_firma_ucus.

select * from zi_cds_tek_firma_ucus( p_carrid = 'AA' )
         into table @data(ucuslar).

cl_demo_output=>display_data( ucuslar ).
