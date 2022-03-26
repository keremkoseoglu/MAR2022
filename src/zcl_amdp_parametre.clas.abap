CLASS zcl_amdp_parametre DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF flight_dict,
             carrid   TYPE sflight-carrid,
             price    TYPE sflight-price,
             currency TYPE sflight-currency,
           END OF flight_dict,

           flight_list TYPE STANDARD TABLE OF flight_Dict WITH DEFAULT KEY.

    CLASS-METHODS get_carrid_flights
      IMPORTING VALUE(mandt)   TYPE sflight-mandt
                VALUE(carrid)  TYPE sflight-carrid
      EXPORTING VALUE(flights) TYPE flight_list.

    CLASS-METHODS get_sel_scr_flights
      IMPORTING VALUE(mandt)         TYPE sflight-mandt
                VALUE(flight_filter) TYPE string
      EXPORTING VALUE(flights)       TYPE flight_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_parametre IMPLEMENTATION.
  METHOD get_carrid_flights
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY USING sflight.

    flights = select carrid, sum( price ) as price, currency
              from sflight
              where mandt  = :mandt  and
                    carrid = :carrid
              group by carrid, currency;

  ENDMETHOD.


  method get_sel_scr_flights
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY USING sflight.

    tmp_flights = select carrid, price, currency from sflight where mandt = :mandt;
    flights = apply_filter( :tmp_flights, :flight_filter );

  endmethod.
ENDCLASS.
