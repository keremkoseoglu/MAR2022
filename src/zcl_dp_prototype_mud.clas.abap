CLASS zcl_dp_prototype_mud DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: matnr TYPE char10 READ-ONLY,
          werks TYPE char4 READ-ONLY,
          lgort TYPE char4 READ-ONLY.

    METHODS constructor
      IMPORTING !matnr TYPE char10
                !werks TYPE char4
                !lgort TYPE char4.

    METHODS calc_uy_stok RETURNING VALUE(result) TYPE i.
    METHODS calc_dy_stok RETURNING VALUE(result) TYPE i.

    METHODS clone
      IMPORTING !new_lgort    TYPE char4
      RETURNING VALUE(result) TYPE REF TO zcl_dp_prototype_mud.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: uy_Stok TYPE i,
          dy_stok TYPE i.
ENDCLASS.



CLASS zcl_dp_prototype_mud IMPLEMENTATION.
  METHOD constructor.
    me->matnr = matnr.
    me->werks = werks.
    me->lgort = lgort.
  ENDMETHOD.


  METHOD calc_uy_Stok.
    ##todo.
    me->uy_stok = 10.
  ENDMETHOD.


  METHOD calc_dy_stok.
    ##todo.
    me->dy_Stok = 4.
  ENDMETHOD.


  METHOD clone.
    result = NEW #( matnr = me->matnr
                    werks = me->werks
                    lgort = new_lgort ).

    result->uy_stok = me->uy_stok.
    result->calc_dy_stok( ).
  ENDMETHOD.
ENDCLASS.
