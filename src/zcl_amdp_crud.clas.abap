CLASS zcl_amdp_crud DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_Amdp_marker_hdb.

    TYPES: BEGIN OF scarr_key_dict,
             mandt  TYPE scarr-mandt,
             carrid TYPE scarr-carrid,
           END OF scarr_key_dict,

           scarr_key_list TYPE STANDARD TABLE OF scarr_key_dict WITH KEY table_line.

    TYPES scarr_list TYPE STANDARD TABLE OF scarr WITH KEY mandt carrid.


    CLASS-METHODS insert_carriers IMPORTING VALUE(carriers) TYPE scarr_list.

    CLASS-METHODS upsert_carriers IMPORTING VALUE(carriers) TYPE scarr_list.

    CLASS-METHODS remove_url
      IMPORTING VALUE(mandt)  TYPE scarr-mandt
                VALUE(carrid) TYPE scarr-carrid.

    CLASS-METHODS change_curr
      IMPORTING VALUE(keys)     TYPE scarr_key_list
                VALUE(new_curr) TYPE scarr-currcode.

    class-methods delete_carriers
      importing value(keys) type scarr_key_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_crud IMPLEMENTATION.
  METHOD insert_carriers
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    USING scarr.

    insert into scarr(mandt, carrid, carrname, currcode, url)
           select * from :carriers;

    --insert into scarr(mandt, carrid, carrname, currcode, url)
    --       values ('001', 'ZKK', 'Test', 'EUR', 'www.google.com');

  ENDMETHOD.


  method upsert_carriers
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    USING scarr.

      upsert scarr(mandt, carrid, carrname, currcode, url)
           select * from :carriers;

  endmethod.


  METHOD remove_url
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    USING scarr.

    update scarr set url = ''
           where mandt  = :mandt and
                 carrid = :carrid;

  ENDMETHOD.


  method change_curr
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    USING scarr.

    declare cursor c1 for select * from :keys;

    for c1_satiri as c1 do
      update scarr set currcode = :new_curr
             where mandt  = c1_satiri.mandt and
                   carrid = c1_satiri.carrid;
    end for;

    -- bla
    -- bla
    -- bla

    -- for c1_satiri as c1 do
    -- end for;
  endmethod.


  method delete_carriers
    BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
    USING scarr.

    declare cursor c1 for select * from :keys;

    for c1_satiri as c1 do
      delete from scarr
             where mandt  = c1_satiri.mandt and
                   carrid = c1_satiri.carrid;
    end for;


  endmethod.
ENDCLASS.
