CLASS zcm_rap_flight DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES if_abap_behv_message.

    CONSTANTS:
      BEGIN OF field_invalid,
        msgid TYPE symsgid VALUE 'ZKKM_RAP',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'FIELDNAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF field_invalid .

    CONSTANTS:
      BEGIN OF no_auth,
        msgid TYPE symsgid VALUE 'ZKKM_RAP',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF no_auth.

    DATA fieldname TYPE fieldname READ-ONLY.

    METHODS constructor
      IMPORTING
        !severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        !textid    LIKE if_t100_message=>t100key OPTIONAL
        !previous  LIKE previous OPTIONAL
        !fieldname TYPE fieldname OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_rap_flight IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->fieldname = fieldname.
  ENDMETHOD.
ENDCLASS.
