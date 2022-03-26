CLASS zcl_amdp_subquery DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_amdp_marker_hdb.

    types: begin of customer_dict,
            id type scustom-id,
            name type scustom-name,
          end of customer_dict,

          customer_list type standard table of customer_dict with key id.

    class-methods get_custs_with_books
      importing value(mandt) type symandt
      exporting value(custs) type customer_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_subquery IMPLEMENTATION.
  method get_custs_with_books
    by database procedure for hdb language sqlscript
    options read-only
    using scustom sbook.

    custs = select scustom.id, scustom.name
            from scustom
            where mandt = :mandt and
                  exists( select mandt from sbook
                          where mandt    = scustom.mandt and
                                customid = scustom.id );

  endmethod.
ENDCLASS.
