@AbapCatalog.sqlViewName: 'ZVIEW_051'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Web siteleri'

/* DİKKAT
aşağıda LH'yi yıldızladım, sonra açacağım
*/

define view ZI_CDS_WEBSITE2
  as select from scarr
{
  key carrid,
      currcode, // Para birimi
      url // Web sitesi
}
where
  currcode = 'EUR'
// and carrid   <> 'LH'
