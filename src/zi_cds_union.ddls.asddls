@AbapCatalog.sqlViewName: 'ZVIEW_439'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union komutu'
define view ZI_CDS_UNION
  as select from zcustom
{
  key id,
      ozel_hitap as name
}
union all select from scustom
{
  key id,
      name
}
