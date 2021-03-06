function T_source = calcT_source(par,F_prodvol,F_postHEXvol,T_phon,T_vapour,T_3He,T_wall)

T_source = ((F_prodvol + F_postHEXvol)./T_phon +...
    (1-F_prodvol - F_postHEXvol)./T_vapour +...
    (F_prodvol + F_postHEXvol)/T_3He + 1/par.T_beta + 1/T_wall)^-1;

end