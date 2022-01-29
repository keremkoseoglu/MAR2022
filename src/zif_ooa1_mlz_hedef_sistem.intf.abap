INTERFACE zif_ooa1_mlz_hedef_sistem
  PUBLIC .

  TYPES: BEGIN OF malzeme_dict,
           matnr TYPE char18,
           maktx TYPE text40,
         END OF malzeme_dict,

         malzeme_list TYPE STANDARD TABLE OF malzeme_Dict WITH KEY matnr.

  METHODS baglanti_testi_yap
    EXPORTING !basari   TYPE abap_bool
              !hata_msg TYPE string.

  METHODS malzeme_gonder
    IMPORTING !malzemeler TYPE malzeme_list
    exporting !basari     type abap_bool.

  methods live_cache default ignore.

ENDINTERFACE.
