@EndUserText.label: 'Uçuş Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['planetype']
define root view entity ZC_RAP_FLIGHT
  as projection on ZI_RAP_FLIGHT
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['carrname']
  key carrid,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['cityfrom']
  key connid,
  key fldate,
      @Semantics.amount.currencyCode: 'currency'
      price,
      currency,
      @ObjectModel.text.element: ['plane_producer']
      planetype,
      _airplane.producer as plane_producer,
      seatsmax,
      seatsocc,
      @Semantics.amount.currencyCode: 'currency'
      paymentsum,
      status,
      price_criticality,
      _carrier.carrname,
      _schedule.cityfrom,
      /* Associations */
      _booking : redirected to composition child ZC_RAP_BOOKING,
      _carrier,
      _schedule,
      _currency,
      _airplane
}
