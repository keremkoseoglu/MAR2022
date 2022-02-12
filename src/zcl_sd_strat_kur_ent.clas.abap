CLASS zcl_sd_strat_kur_ent DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS entegre_et
      IMPORTING !bnkid        TYPE ztdp_strat_bnk-bnkid
      EXPORTING !okuma_sonucu TYPE string
                !yazma_sonucu TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: banka  TYPE REF TO zif_dp_strat_banka,
          kurlar TYPE string.
ENDCLASS.



CLASS zcl_sd_strat_kur_ent IMPLEMENTATION.
  METHOD entegre_et.
    me->banka = zcl_sd_strat_banka_factory=>get_bank_object( bnkid ).
    me->kurlar = me->banka->kurlari_al( ).
    ##todo. " BURAYA YENİ ADIM GELECEK
    yazma_sonucu = NEW zcl_dp_strat_kur_kayit( )->execute( kurlar ).

    Okuma_sonucu = me->kurlar. " Dummy koddur

    " Örnek kodlar """"""""""""""""""""""""""""""""""""""""""""""""""
*    DATA(genel_obje) = zcl_sd_strat_banka_Factory=>get_bank_object( me->bnkid ).
*
*    IF genel_obje IS INSTANCE OF zif_dp_strat_banka.
*    ENDIF.
*
*    cl_abap_classdescr=>get_class_name( genel_obje ). " geriye ZCL_SD_STRAT_TC gibi sınıf ismi döndürür
*    cl_abap_Classdescr=>describe_by_object_ref( genel_obje ).
  ENDMETHOD.

ENDCLASS.
