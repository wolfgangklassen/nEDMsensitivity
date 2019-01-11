function T_phon = calcT_phon(par,Temp_HeII)

T_phon = (par.A*exp(-12/Temp_HeII)+par.B*(Temp_HeII^7) + ...
    par.C*(Temp_HeII^(1.5))*exp(-8.6/Temp_HeII))^-1;

end