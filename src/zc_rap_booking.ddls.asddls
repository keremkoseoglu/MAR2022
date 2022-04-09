@EndUserText.label: 'Kalem tablosu (rezervasyon.) Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_RAP_BOOKING
  as projection on ZI_RAP_BOOKING
{
  key carrid,
  key connid,
  key fldate,
      @Search.defaultSearchElement: true
  key bookid,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['customer_name']
      customid,
      custtype,
      smoker,
      @Semantics.quantity.unitOfMeasure: 'wunit'
      luggweight,
      wunit,
      invoice,
      class,
      @Semantics.amount.currencyCode: 'forcurkey'
      forcuram,
      forcurkey,
      _customer.name as customer_name,
      /* Associations */
      _curr,
      _customer,
      _flight : redirected to parent ZC_RAP_FLIGHT,
      _uom
}
