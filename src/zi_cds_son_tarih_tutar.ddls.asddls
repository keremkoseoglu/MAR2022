@AbapCatalog.sqlViewName: 'ZVIEW_121'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Son tarihteki toplam tutar'
define view ZI_CDS_SON_TARIH_TUTAR
  as select from ZI_CDS_SON_TARIH as _son
    inner join   sflight          as _fli on  _fli.carrid = _son.carrid
                                          and _fli.fldate = _son.son_tarih
{
  key _fli.carrid,
  key _fli.currency,
      sum( _fli.paymentsum ) as toplam_tutar
}
group by
  _fli.carrid,
  _fli.currency
// having _fli.carrid = 'AA'
