@AbapCatalog.sqlViewName: 'ZVIEW_116'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Toplam örneği'
define view ZI_CDS_SUM
  as select from sflight
{
  key carrid,
  key fldate,
  key currency,
      sum( paymentsum ) as toplam_tutar
}
group by
  carrid,
  fldate,
  currency
