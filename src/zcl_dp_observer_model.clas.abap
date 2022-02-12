CLASS zcl_dp_observer_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS save.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dp_observer_model IMPLEMENTATION.
  METHOD save.
    DATA obj TYPE REF TO object.

    ##todo. " ana kayıt işlemini yap

    SELECT clsname FROM seometarel
           WHERE refclsname = @zif_dp_observer=>class-me
           INTO TABLE @DATA(observers).

    LOOP AT observers ASSIGNING FIELD-SYMBOL(<obs>).
      CREATE OBJECT obj TYPE (<obs>-clsname).
      DATA(observer) = CAST zif_dp_observer( obj ).
      ##todo. " aşağıya DUMMY değil gerçek değer yolla
      observer->data_saved( 'DUMMY' ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
