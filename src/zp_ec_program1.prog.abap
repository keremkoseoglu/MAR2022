REPORT zp_ec_program1.

" RESUMABLE
" https://blogs.sap.com/2016/07/07/try-and-retry-catch-and-resume/
" https://help.sap.com/doc/abapdocu_752_index_htm/7.52/en-US/abapresume.htm

CLASS yardimci DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS derin_hatayi_al
      IMPORTING !hata         TYPE REF TO cx_root
      RETURNING VALUE(result) TYPE REF TO cx_root.

    class-methods hata_metni_olustur
      IMPORTING !hata   TYPE REF TO cx_root
      changing  !result TYPE string.
ENDCLASS.


CLASS yardimci IMPLEMENTATION.
  METHOD derin_hatayi_al.
    IF hata->previous IS INITIAL.
      result = hata.
    ELSE.
      result = derin_hatayi_al( hata->previous ).
    ENDIF.
  ENDMETHOD.


  method hata_metni_olustur.
    result = |{ result } | &&
             |{ hata->get_text( ) }|.

    if hata->previous is not initial.
      hata_metni_olustur( EXPORTING hata   = hata->previous
                          CHANGING  result = result ).
    endif.
  endmethod.
ENDCLASS.


START-OF-SELECTION.
  DATA(model) = NEW zcl_ec_model1( ).

  TRY.
      model->kayit_at( ).

    CATCH zcx_ec_veri_kontrol INTO DATA(veri_Hatasi).
      " message veri_Hatasi type 'E'.
*      DATA(msg_text) = veri_Hatasi->get_text( ).
*      WRITE 'haberin olsun: veri hatası oldu'.
*      NEW-LINE.
*      WRITE msg_text.
*
*      IF veri_hatasi->previous IS NOT INITIAL.
*        DATA(prev_msg_text) = veri_hatasi->previous->get_Text( ).
*        NEW-LINE.
*        WRITE prev_msg_text.
*      ENDIF.

*      DATA(en_derin_hata)  = yardimci=>derin_hatayi_al( veri_Hatasi ).
*      DATA(derin_Hata_txt) = en_Derin_Hata->get_text( ).
*      WRITE derin_Hata_txt.

       data(hata_txt) = ||.

       yardimci=>hata_metni_olustur(
         EXPORTING hata   = veri_Hatasi
         CHANGING  result = hata_txt ).

      write hata_txt.

      " WRITE 'Veri hatası oldu'.
      ##todo.
      " mail at
      " rollback
      " sonraki kayda geç
      " ...
*    CATCH zcx_ec_kayit_Hatasi INTO DATA(kayit_hatasi).
*      DATA(msg_text2) = kayit_Hatasi->get_text( ).
*      WRITE msg_text2.

    CATCH cx_root INTO DATA(genel_hata).
      DATA(msg_text4) = genel_hata->get_text( ).
      WRITE 'haberin olsun: genel hata oldu'.
      NEW-LINE.
      WRITE msg_text4.

*      if genel_hata is instance of zcx_ec_veri_hatasi.
*        data(vh) = cast zcx_ec_veri_Hatasi( genel_hata ).
*        new-line.
*        write vh->matnr.
*      endif.

  ENDTRY.
