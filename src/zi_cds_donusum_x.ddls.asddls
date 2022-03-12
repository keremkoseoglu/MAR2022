@AbapCatalog.sqlViewAppendName: 'ZVIEW_504'
@EndUserText.label: 'Extension'
extend view ZI_CDS_DONUSUM with ZI_CDS_DONUSUM_X
{
  sbook.order_date,
  sbook.smoker
}
