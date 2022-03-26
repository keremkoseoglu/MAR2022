CLASS zcl_amdp_ilk_eur_tasimaci DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS get_first_eur_carrier
      EXPORTING VALUE(carrid)   TYPE s_carrid
                VALUE(carrname) TYPE s_carrname.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_ilk_eur_tasimaci IMPLEMENTATION.
  method get_first_eur_carrier
    by database procedure for hdb language sqlscript
    using zi_amdp_eur_tasimaci.

    select carrid, carrname
           into carrid, carrname
           from zi_amdp_eur_tasimaci
           limit 1;

  endmethod.
ENDCLASS.
