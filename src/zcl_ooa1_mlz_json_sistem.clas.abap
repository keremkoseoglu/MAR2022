CLASS zcl_ooa1_mlz_json_sistem DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_ooa1_mlz_hedef_sistem
      ABSTRACT METHODS baglanti_testi_yap
      FINAL METHODS malzeme_gonder live_cache.

  PROTECTED SECTION.
    METHODS karsi_sisteme_gonder ABSTRACT " FINAL da olabilir
      IMPORTING !json  TYPE string
      EXPORTING basari TYPE abap_bool.

  PRIVATE SECTION.
    METHODS jsona_donustur
      IMPORTING !malzemeler   TYPE zif_ooa1_mlz_hedef_sistem=>malzeme_list
      RETURNING VALUE(result) TYPE string.
ENDCLASS.



CLASS zcl_ooa1_mlz_json_sistem IMPLEMENTATION.
  METHOD jsona_donustur.
    ##todo.
    " Verileri JSON formatına dönüştürüp RESULT'a yaz
    result = |\{ 'gecici': 'X'  \}|.
  ENDMETHOD.


  METHOD zif_ooa1_mlz_hedef_sistem~malzeme_gonder.
    DATA(json) = jsona_donustur( malzemeler ).

    karsi_sisteme_gonder( EXPORTING json   = json
                          IMPORTING basari = basari ).
  ENDMETHOD.
ENDCLASS.
