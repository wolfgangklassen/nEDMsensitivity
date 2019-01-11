function T_phon = calcT_phon(par)

T_phon = (par.A*exp(-12/par.Temp_HeII)+par.B*(par.Temp_HeII^7) + ...
    par.C*(par.Temp_HeII^(1.5))*exp(-8.6/par.Temp_HeII))^-1;

end