INTERFACE zif_cor_kural
  PUBLIC .

  TYPES onayci_list TYPE STANDARD TABLE OF xubname WITH EMPTY KEY.

  METHODS onaycilari_belirle
    IMPORTING !booking    TYPE sbook
    EXPORTING !bulabildim TYPE abap_bool
              !onaycilar  TYPE onayci_list.

ENDINTERFACE.
