@AbapCatalog.sqlViewName: 'ZVIEW_512'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Varsa TR yoksa EN getir'
define view ZI_CDS_MAKT_TR_EN
  as select from    scustom
    left outer join zcustom_makt as _makt_logon on  _makt_logon.id    = scustom.id
                                                and _makt_logon.spras = $session.system_language
    left outer join zcustom_makt as _makt_en    on  _makt_en.id    = scustom.id
                                                and _makt_en.spras = 'E'
{
  key scustom.id,
      coalesce( _makt_logon.maktx, _makt_en.maktx ) as maktx
}
