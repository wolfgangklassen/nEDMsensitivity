function Vol_EDMguide = calcVol_EDMguide(par)

Vol_EDMguide = (2*(par.L_EDMguide - par.Pos_yswitch)+par.Pos_yswitch)*(((par.d_EDMguide^2)*pi*1e6)/4);

end