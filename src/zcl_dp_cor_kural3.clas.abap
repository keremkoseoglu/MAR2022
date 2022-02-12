CLASS zcl_dp_cor_kural3 DEFINITION
  INHERITING FROM zcl_dp_cor_abs_kural
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: onayci_ara REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_cor_kural3 IMPLEMENTATION.
  METHOD onayci_ara.
    bulabildim = abap_true.
    onaycilar = VALUE #( ( 'SATIS' ) ).
  ENDMETHOD.
ENDCLASS.
