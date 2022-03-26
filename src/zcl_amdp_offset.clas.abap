CLASS zcl_amdp_offset DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF customer_dict,
             id   TYPE scustom-id,
             name TYPE scustom-name,
           END OF customer_dict,

           customer_list TYPE STANDARD TABLE OF customer_Dict WITH KEY id.

    CLASS-METHODS get_some_custs_with_books
      IMPORTING VALUE(mandt)   TYPE symandt
                VALUE(imax)    TYPE i default 0
                VALUE(ioffset) TYPE i default 0
      EXPORTING VALUE(custs)   TYPE customer_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_offset IMPLEMENTATION.
  method get_some_custs_with_books
    by database procedure for hdb language sqlscript
    options read-only
    using scustom sbook.

    custs = select scustom.id, scustom.name
            from scustom
            where mandt = :mandt and
                  exists( select mandt from sbook
                          where mandt    = scustom.mandt and
                                customid = scustom.id )
            order by scustom.id
            limit :imax offset :ioffset;

  endmethod.
ENDCLASS.
