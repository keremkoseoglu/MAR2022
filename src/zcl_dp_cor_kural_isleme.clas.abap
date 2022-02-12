CLASS zcl_dp_cor_kural_isleme DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.

    METHODS bookid_ile_kurallari_dolas
      IMPORTING !bookid    TYPE sbook-bookid
      EXPORTING !onaycilar TYPE zif_cor_kural=>onayci_list.

    METHODS kurallari_dolas
      IMPORTING !booking   TYPE sbook
      EXPORTING !onaycilar TYPE zif_cor_kural=>onayci_list.

  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF kural_dict,
             clsname TYPE ztdp_cor_kural-clsname,
             cdseq   TYPE ztdp_cor_kural-cdseq,
             obj     TYPE REF TO zif_cor_kural,
           END OF kural_dict,

           kural_list TYPE STANDARD TABLE OF kural_Dict WITH EMPTY KEY.

    TYPES db_list TYPE STANDARD TABLE OF ztdp_cor_kural WITH EMPTY KEY.

    DATA kurallar TYPE kural_list.
    METHODS kural_zinciri_olustur.
ENDCLASS.



CLASS zcl_dp_cor_kural_isleme IMPLEMENTATION.
  METHOD constructor.
    kural_zinciri_olustur( ).
  ENDMETHOD.


  METHOD bookid_ile_kurallari_dolas.
    SELECT SINGLE * FROM sbook
           WHERE bookid = @bookid
           INTO @DATA(booking).

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    kurallari_dolas(
      EXPORTING booking   = booking
      IMPORTING onaycilar = onaycilar ).
  ENDMETHOD.


  METHOD kurallari_dolas.
    CHECK me->kurallar IS NOT INITIAL.

    DATA(ilk_kural) = REF #( me->kurallar[ 1 ] ).

    ilk_kural->obj->onaycilari_belirle(
      EXPORTING booking    = booking
      IMPORTING onaycilar  = onaycilar ).
  ENDMETHOD.


  METHOD kural_zinciri_olustur.
    DATA: prev_kural TYPE REF TO kural_dict,
          db_entries TYPE db_list,
          obj        TYPE REF TO object,
          obj_Abs    TYPE REF TO zcl_dp_cor_Abs_kural.

    SELECT * FROM ztdp_cor_kural
             ORDER BY cdseq DESCENDING
             INTO TABLE @db_entries.

    LOOP AT db_entries REFERENCE INTO DATA(db_entry).
      DATA(kural) = CORRESPONDING kural_dict( db_entry->* ).

      CREATE OBJECT obj TYPE (db_entry->clsname).
      obj_abs ?= obj.

      IF prev_kural IS NOT INITIAL.
        obj_abs->siradaki_kural = prev_kural->obj.
      ENDIF.

      kural-obj ?= obj_abs.
      APPEND kural TO me->kurallar reference into prev_kural.
    ENDLOOP.

    SORT me->kurallar BY cdseq.
  ENDMETHOD.
ENDCLASS.
