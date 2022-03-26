CLASS zcl_amdp_akis DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_Amdp_marker_hdb.

    CLASS-METHODS for_ornegi
      IMPORTING VALUE(limit) TYPE i
      EXPORTING VALUE(chars) TYPE string.

    CLASS-METHODS while_ornegi
      IMPORTING VALUE(limit) TYPE i
      EXPORTING VALUE(chars) TYPE string.

    CLASS-METHODS carrier_ucus_sayisi
      IMPORTING VALUE(mandt)  TYPE mandt
                VALUE(carrid) TYPE scarr-carrid default ''
      EXPORTING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_akis IMPLEMENTATION.
  METHOD for_ornegi
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT.

    declare pozisyon int;
    chars = 'F';

    for pozisyon in 1..:limit do
      chars = chars || pozisyon;
    end for;

  ENDMETHOD.


  METHOD while_ornegi
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT.

    declare pozisyon int;
    chars = 'F';
    pozisyon = 1;

    while pozisyon <= :limit do
      chars = chars || pozisyon;
      pozisyon = pozisyon + 1;
    end while;

  ENDMETHOD.


  method carrier_ucus_sayisi
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    options read-only using scarr sflight.

    -- 10000 - 19999 arasini bize birakmis SAP
    declare bos_carrid condition for SQL_ERROR_CODE 10000;
    declare yanlis_carrid condition for SQL_ERROR_CODE 10001;
    declare tmp_carrid "$ABAP.type( s_carr_id )";

    -- CARRID bos ise hata uret
    if :carrid = null or :carrid = '' then
      signal bos_carrid set message_text = 'Carrier bos gelmis';
    end if;

    -- CARRID gecersiz ise hata uret
    select carrid into tmp_carrid
           from scarr
           where mandt  = :mandt and
                 carrid = :carrid
           limit 1;

    if :tmp_carrid = null or :tmp_carrid = '' then
      signal yanlis_carrid set message_text = 'Carrier hatali';
    end if;

    -- Kontroller bitti, islemi yap
    select count( * ) into result
           from sflight
           where mandt  = :mandt and
                 carrid = :carrid;

  endmethod.
ENDCLASS.
