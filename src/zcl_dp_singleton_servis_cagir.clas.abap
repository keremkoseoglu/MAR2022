CLASS zcl_dp_singleton_servis_cagir DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    methods cagir.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_singleton_servis_cagir IMPLEMENTATION.
  method cagir.
    ##todo. " ön işlemler
    data(toolkit) = zcl_dp_singleton_toolkit=>get_instance( ).

    data(tmp) = toolkit->tarih_farki_hesapla(
                  tarih1 = sy-datum
                  tarih2 = sy-datum ).

    toolkit->zli_tablolari_kilitle( ).
  endmethod.
ENDCLASS.
