@AbapCatalog.sqlViewName: 'ZVIEW_424'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Distinct örneği'
define view ZI_CDS_SBOOK_FUNC02
  as select distinct from sbook
  association [1..1] to scarr as _carrier on _carrier.carrid = $projection.carrid
{
  key sbook.carrid,
  key sbook.fldate,
      _carrier
}
where
  cancelled = ''
