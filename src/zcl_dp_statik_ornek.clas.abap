CLASS zcl_dp_statik_ornek DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA entegrasyon_etkin TYPE abap_bool.

    CLASS-METHODS class_constructor.
    METHODS constructor IMPORTING !matnr TYPE char18.
    METHODS stok_var_mi RETURNING VALUE(result) TYPE abap_bool.
    methods entegrasyonu_kapat.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA matnr TYPE char18.
ENDCLASS.



CLASS zcl_dp_statik_ornek IMPLEMENTATION.
  METHOD class_constructor.
    ##todo. " Z'li tabloyu oku
    zcl_dp_statik_ornek=>entegrasyon_etkin = abap_true.
  ENDMETHOD.


  METHOD constructor.
    me->matnr = matnr.
  ENDMETHOD.


  METHOD stok_var_mi.
    CASE zcl_dp_statik_ornek=>entegrasyon_etkin.
      WHEN abap_true.
        ##todo.
        " me->matnr ile MARD vb tablolarına bak
        result = abap_true.
      WHEN abap_False.
        result = abap_false.
    ENDCASE.
  ENDMETHOD.


  method entegrasyonu_kapat.
    zcl_dp_statik_ornek=>entegrasyon_etkin = abap_false.
  endmethod.
ENDCLASS.
