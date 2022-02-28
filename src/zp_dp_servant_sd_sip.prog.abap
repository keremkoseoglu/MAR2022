*&---------------------------------------------------------------------*
*& Report zp_dp_servant_sd_sip
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_dp_servant_sd_sip.

DATA obj TYPE REF TO object.

PARAMETERS: p_clsnm TYPE seoclsname.

START-OF-SELECTION.
  TRY.
      CREATE OBJECT obj TYPE (p_clsnm).
      DATA(merkez) = NEW zcl_dp_Servant_merkez( ).

      merkez->guvenli_kayit_at(
        EXPORTING gelen_json = 'DUMMY'
                  uygulayan  = CAST #( obj )
        IMPORTING donen_json = DATA(donen_json) ).

      NEW-LINE.
      WRITE donen_json.

    CATCH cx_root INTO DATA(genel_Hata).
      DATA(Hata_metni) = genel_Hata->get_text( ).
      NEW-LINE.
      WRITE hata_metni.
  ENDTRY.
