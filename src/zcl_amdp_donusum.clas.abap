CLASS zcl_amdp_donusum DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF plane_dict,
             planetype  TYPE saplane-planetype,
             weight_ton TYPE saplane-weight,
           END OF plane_dict,

           plane_list TYPE STANDARD TABLE OF plane_dict WITH KEY planetype.

    TYPES: BEGIN OF flight_dict,
             carrid    TYPE sflight-carrid,
             connid    TYPE sflight-connid,
             fldate    TYPE sflight-fldate,
             eur_price TYPE sflight-price,
           END OF flight_dict,

           flight_list TYPE STANDARD TABLE OF flight_dict WITH KEY carrid connid fldate.

    CLASS-METHODS get_sys_date_time
      EXPORTING VALUE(date) TYPE dats
                VALUE(time) TYPE tims.

    CLASS-METHODS get_planes
      IMPORTING VALUE(mandt)  TYPE symandt
      EXPORTING VALUE(planes) TYPE plane_list.

    CLASS-METHODS get_flights
      IMPORTING VALUE(mandt)   TYPE symandt
      EXPORTING VALUE(flights) TYPE flight_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_donusum IMPLEMENTATION.
  METHOD get_sys_Date_time
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT.

    declare my_date date;
    declare my_time time;

    my_date = CURRENT_DATE;
    my_time = CURRENT_TIME;


    -- time = to_char( to_time( my_time ) );



    -- time = hour( my_time ) || minute( my_time ) || lpad( second( my_time ), 2);
    -- time = to_char( to_time( my_time ) );

    -- my_test = SELECT TO_CHAR( LOCALTOUTC ( TO_TIMESTAMP ( CONCAT( TO_DATE ( my_date), LPAD ( TO_TIME ( my_TIME), 9) ) ), 'UTC' ) , 'YYYYMMDD HH24MISS' ) AS LV_TIMESTAMP FROM DUMMY;
    -- my_test2 = select TO_DATS(CURRENT_DATE) AS DATE0 from dummy;
    my_test3 = select TO_TIME(CURRENT_TIME) as TIME0 from dummy;
    date = to_dats( my_date );

  ENDMETHOD.


  METHOD get_planes
  BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY USING saplane.

    planes = select planetype,
                    convert_unit( quantity       => weight,
                                  source_unit    => wei_unit,
                                  schema         => current_schema,
                                  target_unit    => 'TO',
                                  error_handling => 'set to null',
                                  client         => :mandt
                                ) as weight_ton
                     from saplane where mandt = :mandt;

  ENDMETHOD.


  METHOD get_flights
  BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY USING sflight.

    flights = select carrid, connid, fldate,
              convert_currency( amount         => price,
                                source_unit    => currency,
                                schema         => current_schema,
                                target_unit    => 'EUR',
                                reference_date => current_date,
                                client         => :mandt
                              ) as eur_price
              from sflight where mandt = :mandt;

  ENDMETHOD.
ENDCLASS.
