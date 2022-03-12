@AbapCatalog.sqlViewName: 'ZVIEW_144'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tek firmaya ait uçuşlar'
define view ZI_CDS_TEK_FIRMA_UCUS
  with parameters
    p_carrid : s_carr_id
  as select from sflight
{
  key carrid,
  key connid,
  key fldate,
      planetype
}
where
  carrid = $parameters.p_carrid
