function Vol_guidevapour = calcVol_guidevapour(par)

Vol_guidevapour = (par.L_guidevapour*pi*(par.d_guidevapour^2)*1e6)/(4);

end