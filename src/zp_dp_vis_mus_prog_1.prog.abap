REPORT zp_dp_vis_mus_prog_1.

start-of-selection.
  " Ana iş yap """"""""""""""""""""""""""""""""""""""""""""""""""""""
  data(ana) = new zcl_dp_vis_ana_sinif( ).
  ana->ana_isi_yap( ).

  " Ortalama hesapla """"""""""""""""""""""""""""""""""""""""""""""""
  data(ortalamaci) = new zcl_dp_vis_ortalama( ).
  ana->accept( ortalamaci ).

  " Mail at """""""""""""""""""""""""""""""""""""""""""""""""""""""""
  data(mailci) = new zcl_dp_vis_mail_Atma( ).
  ana->accept( mailci ).
