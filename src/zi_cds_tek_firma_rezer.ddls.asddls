@AbapCatalog.sqlViewName: 'ZVIEW_150'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tek firmaya ait rezervasyonlar'
define view ZI_CDS_TEK_FIRMA_REZER
  with parameters
    p_carrid : s_carr_id,
    p_ctype  : s_custtype
  as select from ZI_CDS_TEK_FIRMA_UCUS( p_carrid: $parameters.p_carrid ) as _ucus
    inner join   sbook on  sbook.carrid = _ucus.carrid
                       and sbook.connid = _ucus.connid
                       and sbook.fldate = _ucus.fldate
{
  key sbook.carrid,
  key sbook.connid,
  key sbook.fldate,
  key sbook.bookid,
      sbook.customid,
      sbook.passname
}
where
      sbook.fldate   < $session.system_date
  and sbook.custtype = $parameters.p_ctype
