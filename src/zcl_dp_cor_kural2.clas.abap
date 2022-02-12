CLASS zcl_dp_cor_kural2 DEFINITION
  INHERITING FROM zcl_dp_cor_abs_kural
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: onayci_ara REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_cor_kural2 IMPLEMENTATION.
  METHOD onayci_ara.
    CHECK booking-forcuram >= 600.
    bulabildim = abap_true.
    onaycilar  = VALUE #( ( 'FINANS' ) ( 'DIREKTOR' ) ).
  ENDMETHOD.
ENDCLASS.
