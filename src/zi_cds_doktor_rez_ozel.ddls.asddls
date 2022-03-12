@AbapCatalog.sqlViewName: 'ZVIEW_317'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Özellişmiş doktor rezervasyonu'
define view ZI_CDS_DOKTOR_REZ_OZEL
  as select from ZI_CDS_DOKTOR_REZ as _rez
{
  key _rez.carrid,
  key _rez.connid,
  key _rez.fldate,
  key _rez.bookid,
      @Semantics.eMail.address: true
      _rez._customer.email,
      _flight.seatsmax,
      _eur_website.url,
      _ucus_pb._curr.currdec
}
