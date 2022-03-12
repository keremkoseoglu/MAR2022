@AbapCatalog.sqlViewName: 'ZVIEW_120'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Son uçuş tarihi'
define view ZI_CDS_SON_TARIH
  as select from sflight
{
  key carrid,
      max( fldate ) as son_tarih
}
group by
  carrid
