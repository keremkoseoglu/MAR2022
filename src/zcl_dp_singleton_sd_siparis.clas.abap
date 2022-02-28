CLASS zcl_dp_singleton_sd_siparis DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    methods siparis_yarat.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_singleton_sd_siparis IMPLEMENTATION.
  method siparis_yarat.
    ##todo. " ön işlemler
    data(toolkit) = zcl_dp_singleton_toolkit=>get_instance( ).
    data(tmp) = toolkit->matnr_conv_exit( '123' ).
    toolkit->zli_tablolari_kilitle( ).
    toolkit->yetkiliye_mail_at( ).
  endmethod.
ENDCLASS.
