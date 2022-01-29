REPORT zp_ooa1_mlz_gonderimi.

##todo.
" bu programdan sınıflara eriş
" Z'li tablo aç: IF - CLASS
" zcl_ooa1_mlz_reader tamamla
" zcl_ooa1_mlz_bw tamamla
" zcl_ooa1_mlz_mii tamamla

PARAMETERS: p_sistem TYPE ztooa1_mlz_sis-sistem_id.

START-OF-SELECTION.
  " Malzemeleri oku """""""""""""""""""""""""""""""""""""""""""""""""
  ##todo. " seçim ekranı yapıp, aşağıya parametre gönder
  DATA(malzemeler) = NEW zcl_ooa1_mlz_reader( )->execute( VALUE #( ) ).

  " İstenen sisteme gönder """"""""""""""""""""""""""""""""""""""""""
  DATA: obj    TYPE REF TO object,
        sistem TYPE REF TO zif_ooa1_mlz_hedef_sistem.

  SELECT SINGLE clsname FROM ztooa1_mlz_sis
         WHERE sistem_id = @p_sistem
         INTO @DATA(clsname).

  ##todo. " sınıf bulunamazsa hata ver

  CREATE OBJECT obj TYPE (clsname).
  sistem ?= obj. " CAST ile aynı şey

  sistem->baglanti_testi_yap(
    IMPORTING basari   = DATA(basari)
              hata_msg = DATA(hata_msg) ).

  ##todo. " bağlantı testi başarısızsa, hata üret

  sistem->live_cache( ).

  sistem->malzeme_gonder(
    EXPORTING malzemeler = malzemeler
    IMPORTING basari     = DATA(basari2) ).

  ##todo. " malzemeleri gönderemediysek, mail at

  " Bildirim gönderimi """"""""""""""""""""""""""""""""""""""""""""""
  IF obj IS INSTANCE OF zif_ooa1_mlz_bildirim.
    DATA(bildirim) = CAST zif_ooa1_mlz_bildirim( obj ). " ?= ile aynı şey
    bildirim->bildirim_gonder( ).
  ENDIF.

*  try.
*    bildirim = CAST zif_ooa1_mlz_bildirim( obj ).
*  catch cx_sy_cast...
*  endtry.
