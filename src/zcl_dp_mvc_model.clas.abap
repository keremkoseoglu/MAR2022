CLASS zcl_dp_mvc_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF input_dict,
             carrid_rng TYPE RANGE OF sflight-carrid,
             connid_rng TYPE RANGE OF sflight-connid,
             fldate_rng TYPE RANGE OF sflight-fldate,
           END OF input_dict.

    TYPES sflight_list TYPE STANDARD TABLE OF sflight WITH EMPTY KEY.

    DATA flights TYPE sflight_list READ-ONLY.

    METHODS constructor IMPORTING !input TYPE input_dict.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA input TYPE input_dict.

    METHODS ucuslari_oku.
    METHODS hesap_kitap_yap.
ENDCLASS.



CLASS zcl_dp_mvc_model IMPLEMENTATION.
  METHOD constructor.
    me->input = input.

    ucuslari_oku( ).
    hesap_kitap_yap( ).
  ENDMETHOD.


  METHOD ucuslari_oku.
    "zcl_dp_mvc_model=>statik_Degisken.

    SELECT * FROM sflight
             WHERE carrid   IN @me->input-carrid_rng  AND
                   connid   IN @me->input-connid_rng  AND
                   fldate   IN @me->input-fldate_rng
             INTO CORRESPONDING FIELDS OF TABLE @me->flights.
  ENDMETHOD.


  METHOD hesap_kitap_yap.
    " Ortalama hesabı """""""""""""""""""""""""""""""""""""""""""""""
    DATA(ortalama_hesapci) = NEW zcl_dp_mvc_ortalama( ).
    DATA(ortalama) = ortalama_hesapci->execute( me->flights ).
    ##todo. " yukarıdaki ortalama verilerini değerlendir

    " Toplam hesabı """""""""""""""""""""""""""""""""""""""""""""""""
    DATA(toplam_hesapci) = NEW zcl_dp_mvc_toplam( ).
    DATA(toplam) = toplam_Hesapci->execute( me->flights ).
    ##todo. " yukarıdaki toplam verilerini değerlendir

    " NOTLARIMIZ """"""""""""""""""""""""""""""""""""""""""""""""""""
    " Doğrudan buraya mı kodlasam, alt method'lara mı kırsam, alt sınıflara mı kırsam?
    " Prensip: Bir birim, bir iş yapar (birim = method, class, vs...)
    " A) Loop içinde basit ortalama hesaplamak -> doğrudan burada yapabiliriz
    " B) Önce Loop içinde ortalama hesapla, sonra o ortalamalardan toplam hesapla
    "    -> iki ayrı method: M1 - ortalama, M2 - toplam
    " C) B gibi; ama: Ortalama hesaplamak için 3 alt Method gerekiyor.
    "    -> Ortalama hesaplayan ayrı sınıf
    "
    " 1) GİRİŞ              -> ZCL_DP_MVC_MODEL
    " 1.1) Hoşgeldiniz      -> Method
    " 1.2) ...              -> Ayrı sınıf
    " 1.2.1) ...
    " 1.2.2) ...
    " 1.2.2.1) .....
    " 1.2.2.2) .....
  ENDMETHOD.
ENDCLASS.
