CLASS zcl_amdp_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES: BEGIN OF level_dict,
             mandt TYPE scustom-mandt,
             id    TYPE scustom-id,
             name  TYPE scustom-name,
             level TYPE char10, " VIP / NORMAL
           END OF level_dict,

           level_list TYPE STANDARD TABLE OF level_Dict WITH KEY id.

    CLASS-METHODS get_customer_levels
      IMPORTING VALUE(mandt)  TYPE symandt
      EXPORTING VALUE(levels) TYPE level_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_case IMPLEMENTATION.
  method get_customer_levels
    by DATABASE PROCEDURE FOR HDB LANGUAGE sqlscript
    options read-only
    using sbook scustom.

    bookings = select mandt, customid, count( * ) as book_count
               from sbook
               where mandt = :mandt
               group by mandt, customid;

    levels = select :bookings.mandt,
                    :bookings.customid as id,
                    scustom.name,
                    case when :bookings.book_count > 10
                         then 'VIP'
                         else 'NORMAL'
                    end as level
                    from :bookings
                         inner join scustom on scustom.mandt = :bookings.mandt and
                                               scustom.id    = :bookings.customid
                    order by mandt, level desc, id;

  endmethod.
ENDCLASS.
