INTERFACE zif_dp_observer
  PUBLIC .

  CONSTANTS: BEGIN OF class,
               me TYPE seoclsname VALUE 'ZIF_DP_OBSERVER',
             END OF class.

  METHODS data_Saved IMPORTING !veri TYPE string.

ENDINTERFACE.
