@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Uçuş bilgileri'
define root view entity ZI_RAP_FLIGHT
  as select from sflight
  composition [0..*] of ZI_RAP_BOOKING  as _booking
  association [0..1] to scarr           as _carrier  on  _carrier.carrid = $projection.carrid
  association [0..1] to spfli           as _schedule on  _schedule.carrid = $projection.carrid
                                                     and _schedule.connid = $projection.connid
  association [0..1] to scurx           as _currency on  _currency.currkey = $projection.currency
  association [0..1] to ZI_RAP_AIRPLANE as _airplane on  _airplane.planetype = $projection.planetype
{
  key carrid,
  key connid,
  key fldate,
      @Semantics.amount.currencyCode: 'currency'
      price,
      currency,
      planetype,
      seatsmax,
      seatsocc,
      @Semantics.amount.currencyCode: 'currency'
      paymentsum,
      seatsmax_b as status,
      case when price < 20 then 1      // kirmizi
           when price < 2000 then 2   // sari
           else 3                     // yesil
           end   as price_criticality,
      _booking,
      _carrier,
      _schedule,
      _currency,
      _airplane
}
