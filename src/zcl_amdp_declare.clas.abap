CLASS zcl_amdp_declare DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_amdp_marker_hdb.

    types scarr_list type standard table of scarr with empty key.

    class-methods declare_ornek exporting value(carriers) type scarr_list.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_declare IMPLEMENTATION.
  method declare_ornek
    by DATABASE PROCEDURE FOR HDB LANGUAGE sqlscript using scarr.

    declare lokal_scarr scarr;

    lokal_scarr = select * from scarr;
    carriers = select * from :lokal_scarr;

  endmethod.
ENDCLASS.
