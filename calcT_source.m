function T_source = calcT_source(par,VolFrac_He,T_vapour,T_phon,T_3He)

T_source = (((1 - VolFrac_He)/(T_vapour))+(VolFrac_He/T_phon)+(VolFrac_He/T_3He)+(1/par.T_beta)+(1/par.T_wall))^-1;

end