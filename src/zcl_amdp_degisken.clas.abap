CLASS zcl_amdp_degisken DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_amdp_marker_hdb.

    class-methods degisken_demo exporting value(output) type string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_degisken IMPLEMENTATION.
  method degisken_demo
    by database PROCEDURE FOR HDB LANGUAGE sqlscript
    options read-only using scustom.

    declare x int;
    declare y "$ABAP.type( s_custname )";
    declare z varchar( 10 );

    -- Dogrudan deger atama
    x = 2;

    -- ABAP tipine atama yapalim
    select name into y
           from scustom
           limit 1;

    -- Concatenate
    z = x || ' - ' || y;

    -- Final
    output = z;
  endmethod.
ENDCLASS.
