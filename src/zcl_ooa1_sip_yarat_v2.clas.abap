CLASS zcl_ooa1_sip_yarat_v2 DEFINITION
  inheriting from zcl_ooa1_sip_yarat
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    methods siparis_simulasyon REDEFINITION.
    methods siparis_yarat redefinition.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ooa1_sip_yarat_v2 IMPLEMENTATION.
  method siparis_simulasyon.
    write:/ 'V2 ilk simulasyon kodlari calisti'.

    super->siparis_simulasyon(
      EXPORTING input          = input
      IMPORTING kontrol_sonucu = kontrol_sonucu ).

    ##todo. " geçici kod
    write:/ 'V2 son simulasyon kodlari calisti'.
  endmethod.


  METHOD siparis_yarat.
    ##todo. " geçici kod
    write:/ 'V2 ek sip kodlari calisti'.
  ENDMETHOD.

ENDCLASS.
