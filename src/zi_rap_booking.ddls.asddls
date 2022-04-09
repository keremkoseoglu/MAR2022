@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rezervasyonlar'
define view entity ZI_RAP_BOOKING
  as select from sbook
  association        to parent ZI_RAP_FLIGHT as _flight   on  _flight.carrid = $projection.carrid
                                                          and _flight.connid = $projection.connid
                                                          and _flight.fldate = $projection.fldate
  association [0..1] to scustom              as _customer on  _customer.id = $projection.customid
  association [0..1] to t006                 as _uom      on  _uom.msehi = $projection.wunit
  association [0..1] to scurx                as _curr     on  _curr.currkey = $projection.forcurkey
{
  key carrid,
  key connid,
  key fldate,
  key bookid,
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
      _flight,
      _customer,
      _uom,
      _curr
}
