CLASS zcl_dp_vis_ortalama DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces ZIF_DP_VISITOR.

    data ortalamalar type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_vis_ortalama IMPLEMENTATION.
  METHOD zif_dp_visitor~visit.
    ##todo.
    " Burada hesap yapılacak
    " ORTALAMALAR'ın tipini değiştir
    " hesaplanan ortalamaları ORTALAMALAR'a yaz
    new-line.
    write 'Ortalama hesaplandı'.
  ENDMETHOD.
ENDCLASS.
