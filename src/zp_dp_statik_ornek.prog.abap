REPORT zp_dp_statik_ornek.

start-of-selection.
  data(malz01) = new zcl_dp_Statik_ornek( '123' ).
  data(stok01) = malz01->stok_var_mi( ).

  data(malz02) = new zcl_dp_statik_ornek( '456' ).
  data(stok02) = malz02->stok_var_mi( ).
  malz02->entegrasyonu_kapat( ).

  clear: malz01, malz02.

  new-line.
  write zcl_dp_statik_ornek=>entegrasyon_etkin.
  zcl_dp_statik_ornek=>entegrasyon_etkin = 'X'.
  new-line.
  write zcl_dp_statik_ornek=>entegrasyon_etkin.
