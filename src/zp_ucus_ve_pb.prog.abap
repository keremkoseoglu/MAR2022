*&---------------------------------------------------------------------*
*& Report zp_ucus_ve_pb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_ucus_ve_pb.

select carrid, connid, fldate, currency,
       \_curr-currdec as currdec,
       \_doktor_rez\_customer-street as street
       from ZI_CDS_UCUS_VE_PB
       into table @data(sonuclar).

cl_demo_output=>display_data( sonuclar ).
