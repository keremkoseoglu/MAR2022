REPORT zp_ooa1_hello.

START-OF-SELECTION.
  DATA(hello_obj)   = NEW zcl_ooa1_hello( ).
  DATA(hello_text)  = hello_obj->get_text( ).
  WRITE hello_text.

*form get_text_xxx changing !result type string.
*  result = 'hello world'.
*endform.
