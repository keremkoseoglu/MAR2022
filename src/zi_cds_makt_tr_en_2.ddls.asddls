@AbapCatalog.sqlViewName: 'ZVIEW_514'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'İkinci CDS'
define view ZI_CDS_MAKT_TR_EN_2
  as select from scustom
  association [0..1] to ZI_CDS_MAKT_TR_EN as _ilk_bulunan_metin on _ilk_bulunan_metin.id = $projection.id
{
  key scustom.id,
      scustom.email,
      _ilk_bulunan_metin
}
