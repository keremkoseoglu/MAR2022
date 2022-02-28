CLASS zcl_dp_singleton_toolkit DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    CLASS-METHODS get_instance
      RETURNING VALUE(result) TYPE REF TO zcl_dp_singleton_toolkit.

    METHODS matnr_conv_exit
      IMPORTING !matnr        TYPE char18
      RETURNING VALUE(result) TYPE char18.

    METHODS tarih_farki_hesapla
      IMPORTING !tarih1       TYPE dats
                !tarih2       TYPE dats
      RETURNING VALUE(result) TYPE i.

    METHODS zli_tablolari_kilitle.

    METHODS yetkiliye_mail_at.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA singleton TYPE REF TO zcl_dp_singleton_toolkit.

    DATA zli_tablolar_kilitlendi TYPE abap_bool.

ENDCLASS.



CLASS zcl_dp_singleton_toolkit IMPLEMENTATION.
  METHOD get_instance.
    IF zcl_dp_singleton_toolkit=>singleton IS INITIAL.
      zcl_dp_singleton_toolkit=>singleton = NEW #( ).
    ENDIF.

    result = zcl_dp_singleton_toolkit=>singleton.
  ENDMETHOD.


  METHOD matnr_conv_exit.
    ##todo.
  ENDMETHOD.


  METHOD tarih_farki_Hesapla.
    ##todo.
  ENDMETHOD.


  METHOD zli_tablolari_kilitle.
    IF me->zli_tablolar_kilitlendi = abap_true.
      RETURN.
    ENDIF.

    ##todo. " Z'li tabloları kilitle
    me->zli_tablolar_kilitlendi = abap_true.
  ENDMETHOD.


  METHOD yetkiliye_mail_at.
    ##todo.
  ENDMETHOD.
ENDCLASS.
