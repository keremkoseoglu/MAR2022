CLASS zcl_dp_lazy_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS veri_oku.
    METHODS kayit_at.
    METHODS log_kaydet.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA log TYPE REF TO zcl_dp_lazy_log.
ENDCLASS.



CLASS zcl_dp_lazy_model IMPLEMENTATION.
  METHOD veri_oku.
    ##todo.
  ENDMETHOD.


  METHOD kayit_at.
    ##todo.
  ENDMETHOD.


  METHOD log_kaydet.
    IF log IS INITIAL.
      log = NEW #( ).
    ENDIF.

    log->kaydet( ).
  ENDMETHOD.
ENDCLASS.
