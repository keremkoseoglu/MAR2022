*&---------------------------------------------------------------------*
*& Report zp_dp_multiton
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_dp_multiton.

TYPES musteri_list TYPE STANDARD TABLE OF char10 WITH KEY table_line.

START-OF-SELECTION.
  ##todo. " excel'den yükle
  DATA(musteriler) = VALUE musteri_list( ( 'AA' ) ( 'BB' ) ( 'AA' ) ( 'CC' ) ( 'AA' ) ).

  LOOP AT musteriler ASSIGNING FIELD-SYMBOL(<kunnr>).
    DATA(musteri_obj) = zcl_dp_multiton_musteri=>get_instance( <kunnr> ).

    IF musteri_obj->falan = abap_true.
      ##todo.
    ENDIF.

    NEW-LINE.
    WRITE musteri_obj->name1.
  ENDLOOP.
