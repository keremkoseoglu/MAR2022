INTERFACE zif_dp_visitor
  PUBLIC .

  METHODS visit
    IMPORTING !ana_obje   TYPE REF TO zcl_dp_vis_ana_sinif
              !giz1       TYPE char10
              !giz2       TYPE char10
              !simulasyon TYPE abap_bool DEFAULT abap_False
    EXPORTING !sonuc      TYPE char10 .

  METHODS kayit_atiyor_musun DEFAULT IGNORE
    RETURNING VALUE(result) TYPE abap_bool.

ENDINTERFACE.
