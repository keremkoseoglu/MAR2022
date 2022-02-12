CLASS zcl_dp_vis_ana_sinif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES carrier_list TYPE STANDARD TABLE OF scarr WITH EMPTY KEY.

    DATA carriers TYPE carrier_list.

    METHODS ana_isi_yap.
    METHODS accept IMPORTING !visitor TYPE REF TO zif_dp_visitor.

  PROTECTED SECTION.
  PRIVATE SECTION.
    data: gizli1 type char10,
          gizli2 type char10.
ENDCLASS.



CLASS zcl_dp_vis_ana_sinif IMPLEMENTATION.
  METHOD ana_isi_yap.
    ##todo. " Burada gerçek ana işi kodla
    SELECT * FROM scarr INTO TABLE @me->carriers.
  ENDMETHOD.


  METHOD accept.
    IF visitor->kayit_atiyor_musun( ).
      ##todo. " yetki kontrolü
    ENDIF.

    visitor->visit(
      exporting ana_obje = me
                giz1     = me->gizli1
                giz2     = me->gizli2
      importing sonuc    = data(vis_sonuc) ).

    ##todo. " vis_sonuc
  ENDMETHOD.
ENDCLASS.
