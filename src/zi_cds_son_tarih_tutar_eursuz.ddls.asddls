@AbapCatalog.sqlViewName: 'ZVIEW_130'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EUR hariç son tarih tutarlar'
define view ZI_CDS_SON_TARIH_TUTAR_EURSUZ
  as select from    ZI_CDS_SON_TARIH_TUTAR as _tutar
    left outer join ZI_CDS_WEBSITE2        as _eur on _eur.carrid = _tutar.carrid
{
  key _tutar.carrid,
  key _tutar.currency,
      _tutar.toplam_tutar
}
where
  _eur.carrid is null
