REPORT zp_ooa1_sip_yarat.

DATA model TYPE REF TO zcl_ooa1_sip_yarat.

##todo. " düzgün seçim ekranı yap

PARAMETERS: p_simul RADIOBUTTON GROUP rg1,
            p_kayit RADIOBUTTON GROUP rg1.

PARAMETERS: p_v1 RADIOBUTTON GROUP rg2,
            p_V2 RADIOBUTTON GROUP rg2.

START-OF-SELECTION.
  " Nesne yarat """""""""""""""""""""""""""""""""""""""""""""""""""""
  CASE abap_true.
    WHEN p_v1.
      model = NEW zcl_ooa1_sip_yarat( ).
    WHEN p_v2.
      DATA(model_v2) = NEW zcl_ooa1_sip_yarat_v2( ).
      model ?= model_V2.
  ENDCASE.

  " Kodu yürüt """"""""""""""""""""""""""""""""""""""""""""""""""""""
  CASE abap_True.
    WHEN p_simul.
      ##todo. " aşağıya değerleri yolla
      model->siparis_simulasyon(
        EXPORTING input          = VALUE #( )
        IMPORTING kontrol_sonucu = DATA(sonuc) ).

    WHEN p_kayit.
      ##todo. " aşağıya değerleri yolla
      model->siparis_yarat(
        EXPORTING input          = VALUE #( )
        IMPORTING kontrol_sonucu = sonuc ).
  ENDCASE.

  ##todo.
  " sonucu değerlendirip ekranda göster

  WRITE: 'Program bitti'.
