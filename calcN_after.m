function N_after = calcN_after(par,N_UCNt0,T_HgAbs)

N_after = N_UCNt0*exp(-par.T_EDM/par.T_0)*exp(-par.T_EDM/T_HgAbs);

end