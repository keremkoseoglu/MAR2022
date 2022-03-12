@AbapCatalog.sqlViewName: 'ZVIEW_303'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Doktorların rezervasyonları'
define view ZI_CDS_DOKTOR_REZ
  as select from sbook
  //left outer join scustom on scustom.id = sbook.customid
  //inner join sflight on sflight....
  association [1..1] to scustom           as _customer    on  _customer.id = $projection.customid
  association [1..1] to sflight           as _flight      on  _flight.carrid = $projection.carrid
                                                          and _flight.connid = $projection.connid
                                                          and _flight.fldate = $projection.fldate
  //and _flight.carrid = 'AA'
  association [0..1] to ZI_CDS_WEBSITE2   as _eur_website on  _eur_website.carrid = $projection.carrid
  association [1..1] to ZI_CDS_UCUS_VE_PB as _ucus_pb     on  _ucus_pb.carrid = $projection.carrid
                                                          and _ucus_pb.connid = $projection.connid
                                                          and _ucus_pb.fldate = $projection.fldate
{
      // Olağan alanlar
  key sbook.carrid,
  key sbook.connid,
  key sbook.fldate,
  key sbook.bookid,
      sbook.customid,
      sbook.custtype,
      sbook.passname,
      // Association'lar
      _customer,
      _flight,
      _eur_website,
      _ucus_pb
}
where
  passname like 'Dr.%'
