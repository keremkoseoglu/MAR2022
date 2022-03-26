CLASS zcl_amdp_fuzzy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    TYPES airport_list TYPE STANDARD TABLE OF sairport WITH EMPTY KEY.

    CLASS-METHODS find_airports_exact
      IMPORTING VALUE(name_txt) TYPE sairport-name
      EXPORTING VALUE(airports) TYPE airport_list.

    CLASS-METHODS find_airports_fuzzy
      IMPORTING VALUE(name_txt) TYPE sairport-name
      EXPORTING VALUE(airports) TYPE airport_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_fuzzy IMPLEMENTATION.
  METHOD find_airports_exact
  BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY USING sairport.

    airports = select * from sairport
               where contains(name, :name_txt, exact);

  ENDMETHOD.


  METHOD find_airports_fuzzy
  BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY USING sairport.

    airports = select * from sairport
               where contains(name,
                              :name_txt,
                              fuzzy(0.8, 'similarCalculationMode=search') );

  ENDMETHOD.
ENDCLASS.
