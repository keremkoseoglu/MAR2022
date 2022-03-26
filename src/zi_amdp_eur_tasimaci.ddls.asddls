@AbapCatalog.sqlViewName: 'ZAMDP037'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EUR para birimli taşımacılar'
define view ZI_AMDP_EUR_TASIMACI
  as select from scarr
{
  key mandt,
  key carrid,
      carrname
}
where
  currcode = 'EUR';
