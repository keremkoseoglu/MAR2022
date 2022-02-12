CLASS zcl_dp_cor_kural1 DEFINITION
  INHERITING FROM zcl_dp_cor_abs_kural
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: onayci_ara REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_cor_kural1 IMPLEMENTATION.
  METHOD onayci_ara.
    CHECK booking-carrid = 'LH'.
    bulabildim = abap_true.
    onaycilar  = VALUE #( ( 'AHMET' ) ( 'MEHMET' ) ).
  ENDMETHOD.
ENDCLASS.
