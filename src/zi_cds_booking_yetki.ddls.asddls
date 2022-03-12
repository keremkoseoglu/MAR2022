@AbapCatalog.sqlViewName: 'ZVIEW_523'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking tablosuna yetkili erişim'
define view ZI_CDS_BOOKING_YETKI
  as select from sbook
{
  key carrid,
  key connid,
  key fldate,
  key bookid,
      custtype,
      customid,
      class
}
