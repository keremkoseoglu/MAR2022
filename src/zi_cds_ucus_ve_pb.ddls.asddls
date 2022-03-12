@AbapCatalog.sqlViewName: 'ZVIEW_323'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Uçuş ve para birimi'
define view ZI_CDS_UCUS_VE_PB
  as select from sflight
  association [1..1] to scurx             as _curr        on  _curr.currkey = $projection.currency
  association [0..*] to ZI_CDS_DOKTOR_REZ as _doktor_rez  on  _doktor_rez.carrid = $projection.carrid
                                                          and _doktor_rez.connid = $projection.connid
                                                          and _doktor_rez.fldate = $projection.fldate
  association [0..*] to sbook             as _tum_rez     on  _tum_rez.carrid = $projection.carrid
                                                          and _tum_rez.connid = $projection.connid
                                                          and _tum_rez.fldate = $projection.fldate
  association [1..1] to sflight           as _tum_alanlar on  _tum_alanlar.carrid = $projection.carrid
                                                          and _tum_alanlar.connid = $projection.connid
                                                          and _tum_alanlar.fldate = $projection.fldate
{
  key sflight.carrid,
  key sflight.connid,
  key sflight.fldate,
      sflight.currency,
      _curr,
      _doktor_rez,
      _tum_rez,
      _tum_alanlar
}
