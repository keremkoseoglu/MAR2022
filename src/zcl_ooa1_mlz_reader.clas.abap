CLASS zcl_ooa1_mlz_reader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  ##todo.
  " aşağıyı tamamla
  " zp_ooa1_mlz_gonderimi devam

  PUBLIC SECTION.
    TYPES: BEGIN OF input_dict,
             matnr_rng TYPE RANGE OF char18,
           END OF input_dict.

    METHODS execute
      IMPORTING !input        TYPE input_dict
      RETURNING VALUE(result) TYPE zif_ooa1_mlz_hedef_sistem=>malzeme_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ooa1_mlz_reader IMPLEMENTATION.
  METHOD execute.
    ##todo.
    " kriterlere uygun malzemeleri oku
    " result'a yaz
  ENDMETHOD.
ENDCLASS.
