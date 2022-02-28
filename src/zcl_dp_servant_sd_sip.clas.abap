CLASS zcl_dp_servant_sd_sip DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces zif_dp_servant_uygulayan.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_servant_sd_sip IMPLEMENTATION.
  METHOD zif_dp_servant_uygulayan~gercek_kayit.
    new-line.
    write 'SD sipariş kaydı atıldı'.
  ENDMETHOD.

  METHOD zif_dp_servant_uygulayan~json_parse_et.
    new-line.
    write 'SD sip JSON parse edildi'.
  ENDMETHOD.

  METHOD zif_dp_servant_uygulayan~simulasyon.
    new-line.
    write 'SD sip simüle edildi'.
  ENDMETHOD.

  METHOD zif_dp_servant_uygulayan~veri_kontrolu.
    new-line.
    write 'SD sip veri kontrolü başarılı'.
  ENDMETHOD.

ENDCLASS.
