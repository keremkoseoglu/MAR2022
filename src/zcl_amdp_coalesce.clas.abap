CLASS zcl_amdp_coalesce DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF last_carrid_dict,
             customid TYPE scustom-id,
             name     TYPE scustom-name,
             carrid   TYPE sbook-carrid,
           END OF last_carrid_dict,

           last_carrid_list TYPE STANDARD TABLE OF last_carrid_dict WITH KEY customid.

    class-methods get_last_carrids
      importing value(mandt) type symandt
      exporting value(carrids) type last_carrid_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_coalesce IMPLEMENTATION.
  method get_last_carrids
    by database procedure for hdb language sqlscript
    options read-only using sbook scustom.

    last_bookings = select customid, max( bookid ) as bookid
                    from sbook
                    where mandt = :mandt
                    group by customid;

    carrids = select scustom.id as customid,
                     scustom.name as name,
                     coalesce( sbook.carrid, '???' ) as carrid
                     from scustom
                          left outer join :last_bookings on :last_bookings.customid = scustom.id
                          left outer join sbook on sbook.bookid = :last_bookings.bookid
                     where scustom.mandt = :mandt
                     order by carrid;

  endmethod.
ENDCLASS.
