CLASS zcl_dp_cor_abs_kural DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_cor_kural ALL METHODS FINAL.

    DATA siradaki_kural TYPE REF TO zif_cor_kural.
  PROTECTED SECTION.
    METHODS onayci_ara ABSTRACT
      IMPORTING !booking    TYPE sbook
      EXPORTING !bulabildim TYPE abap_bool
                !onaycilar  TYPE zif_cor_kural=>onayci_list.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_dp_cor_abs_kural IMPLEMENTATION.
  METHOD zif_cor_kural~onaycilari_belirle.
    onayci_ara( EXPORTING booking    = booking
                IMPORTING bulabildim = bulabildim
                          onaycilar  = onaycilar ).

    IF bulabildim = abap_true.
      RETURN.
    ENDIF.

    IF siradaki_kural IS NOT INITIAL.
      siradaki_kural->onaycilari_belirle(
        EXPORTING booking    = booking
        IMPORTING bulabildim = bulabildim
                  onaycilar  = onaycilar ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
