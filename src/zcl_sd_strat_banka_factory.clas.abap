CLASS zcl_sd_strat_banka_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_bank_object
      IMPORTING !bnkid        TYPE ztdp_strat_bnk-bnkid
      RETURNING VALUE(result) TYPE REF TO zif_dp_Strat_banka.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sd_strat_banka_factory IMPLEMENTATION.
  METHOD get_bank_object.
    DATA obj TYPE REF TO object.
    ##todo. " Burası daha düzgün yazılacak

    SELECT SINGLE clsname FROM ztdp_strat_bnk
           WHERE bnkid = @bnkid
           INTO @DATA(clsname).

    CREATE OBJECT obj TYPE (clsname).
    result ?= obj.
  ENDMETHOD.
ENDCLASS.
