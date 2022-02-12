FUNCTION ZF_DP_MVC_ENTEGRASYON.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(FLDATE) TYPE  SFLIGHT-FLDATE
*"  TABLES
*"      FLIGHTS STRUCTURE  SFLIGHT OPTIONAL
*"----------------------------------------------------------------------
  data(model) =
    new zcl_dp_mvc_model(
            value #( fldate_rng = value #( ( sign   = 'I'
                                             option = 'EQ'
                                             low    = fldate ) ) ) ).

  flights[] = model->flights.

ENDFUNCTION.
