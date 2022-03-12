@AbapCatalog.sqlViewName: 'ZVIEW_107'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EUR uçuşları'
define view ZI_CDS_EUR_UCUS
  as select from ZI_CDS_WEBSITE2 as _eur
    inner join   sflight         as _fli on _fli.carrid = _eur.carrid
  // Left Outer Join ...
{
  key _fli.carrid,
  key _fli.connid,
  key _fli.fldate,
      price,
      currency,
      planetype
}
