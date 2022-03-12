@AbapCatalog.sqlViewName: 'ZVIEW_410'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SBOOK üzerinden örnek fonksiyonalite'
define view ZI_CDS_SBOOK_FUNC01
  as select from sbook
{
  key carrid,
  key connid,
  key fldate,
  key bookid,
      customid,
      cast( case when luggweight > 0
            then 'X' else '' end
            as xfeld )                               as valizli,
      concat( carrid, custtype )                     as kerem1,
      concat_with_space(carrid, custtype, 5)         as kerem2,
      concat( carrid, concat( custtype, customid ) ) as kerem3,
      concat( carrid, concat( '-', customid ) )      as kerem4,
      substring(passname, 1, 3)                      as kisa_ad,
      ( loccuram * 2 )                               as fiyatin_iki_kati
}
where
  custtype = 'P'
