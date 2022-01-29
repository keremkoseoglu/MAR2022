CLASS zcl_ooa1_sip_yarat DEFINITION
  PUBLIC
  CREATE PUBLIC .

  ##todo.
  " aşağıdaki işleri temizle
  " programı yaz

  PUBLIC SECTION.
    TYPES: BEGIN OF sip_input_dict,
             tarih TYPE dats,
             dummy TYPE char1,
           END OF sip_input_dict.

    TYPES: BEGIN OF sonuc_dict,
             basarili TYPE abap_bool,
             hata     TYPE string,
           END OF sonuc_Dict.

    METHODS siparis_simulasyon
      IMPORTING !input          TYPE sip_input_Dict
      EXPORTING !kontrol_sonucu TYPE sonuc_dict.

    METHODS siparis_yarat
      IMPORTING !input          TYPE sip_input_Dict
      EXPORTING !kontrol_sonucu TYPE sonuc_dict.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS veri_kontrolu
      IMPORTING !input        TYPE sip_input_Dict
                !yetkiye_bak  TYPE abap_bool
      RETURNING VALUE(result) TYPE sonuc_dict.
ENDCLASS.



CLASS zcl_ooa1_sip_yarat IMPLEMENTATION.
  METHOD siparis_simulasyon.
    kontrol_sonucu = veri_kontrolu( input       = input
                                    yetkiye_bak = abap_false ).

    IF kontrol_Sonucu-basarili = abap_False.
      RETURN.
    ENDIF.

    write:/ 'Sim OK'.

    ##todo. " BAPI çağırıp simülasyon yap
  ENDMETHOD.


  METHOD siparis_yarat.
    kontrol_sonucu = veri_kontrolu( input       = input
                                    yetkiye_bak = abap_true ).

    IF kontrol_Sonucu-basarili = abap_False.
      RETURN.
    ENDIF.

    write:/ 'Sip OK'.

    ##todo.
    " BAPI çağırıp kayıt yarat
    " log sınıfı açıp logla
    " VBAK-ZZXX alanını unutma
  ENDMETHOD.


  METHOD veri_kontrolu.
    ##todo.
    " yetki kontrolü yapılacak
    " lock kontrolü yapılacak
    result-basarili = abap_true.
  ENDMETHOD.
ENDCLASS.
