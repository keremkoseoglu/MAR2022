@AbapCatalog.sqlViewName: 'ZVIEW_431'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Coalesce örneği'
define view ZI_CDS_coalesce
  as select from    sbook
    left outer join scustom on scustom.id = sbook.customid
    left outer join zcustom on zcustom.id = sbook.customid
{
  key carrid,
  key connid,
  key fldate,
  key bookid,
      customid,
      @Semantics.organization.name: true
      coalesce( zcustom.ozel_hitap, coalesce( scustom.name, 'YOK' ) ) as name,
      @Semantics.organization.name: true
      case when zcustom.id is not null
           then zcustom.ozel_hitap
           when scustom.id is not null
           then scustom.name
           else 'YOK'
           end                                                        as name2
}
