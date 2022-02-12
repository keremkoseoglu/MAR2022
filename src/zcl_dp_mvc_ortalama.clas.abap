CLASS zcl_dp_mvc_ortalama DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS execute
      IMPORTING !flights      TYPE zcl_dp_mvc_model=>sflight_list
      RETURNING VALUE(result) TYPE char1.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS alt_method_1.
    METHODS alt_method_2.
    METHODS alt_method_3.
    METHODS alt_method_4.
ENDCLASS.



CLASS zcl_dp_mvc_ortalama IMPLEMENTATION.
  METHOD execute.
    ##todo.
    " dummy parametreleri gerçeğe çevir
    alt_method_1( ).
    alt_method_2( ).
    alt_method_3( ).
    alt_method_4( ).
    ##todo. " RESULT'a sonucu yaz
  ENDMETHOD.


  METHOD alt_method_1.
    ##todo.
  ENDMETHOD.


  METHOD alt_method_2.
    ##todo.
  ENDMETHOD.


  METHOD alt_method_3.
    ##todo.
  ENDMETHOD.


  METHOD alt_method_4.
    ##todo.
  ENDMETHOD.
ENDCLASS.
