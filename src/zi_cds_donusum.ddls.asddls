@AbapCatalog.sqlViewName: 'ZVIEW_442'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Dönüşümler'
define view ZI_CDS_DONUSUM
  as select from sbook
{
  key carrid,
  key connid,
  key fldate,
  key bookid,
      @Semantics.quantity.unitOfMeasure: 'wunit'
      luggweight,
      @Semantics.unitOfMeasure: true
      wunit,
      unit_conversion( quantity => luggweight,
                       source_unit => wunit,
                       target_unit => cast('G' as abap.unit(3) ) ) as gram,
      @Semantics.amount.currencyCode: 'forcurkey'
      forcuram,
      @Semantics.currencyCode: true
      forcurkey,
      currency_conversion( amount => forcuram,
                           source_currency => forcurkey,
                           target_currency => cast('USD' as abap.cuky(5)),
                           exchange_rate_date => order_date )      as dolar_tutar
}
where
  luggweight > 0
