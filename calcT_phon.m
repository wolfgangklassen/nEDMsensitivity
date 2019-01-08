function T_phon = calcT_phon(par)

T_phon = (par.A*exp(-12/par.T_HeII)+par.B*(par.T_HeII^7) + par.C*(par.T_HeII^(1.5))*exp(-8.6/par.T_HeII))^-1;

end