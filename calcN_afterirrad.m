function N_afterirrad = calcN_afterirrad(par,T_source,T_irrad,F_source)

N_afterirrad = par.P_UCN*T_source*(1-exp(-T_irrad/T_source))*F_source;

end