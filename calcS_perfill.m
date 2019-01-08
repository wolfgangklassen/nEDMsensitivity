function S_perfill = calcS_perfill(const,par,T_ramsey,N_gooducndetected,alpha)

S_perfill = (const.hbar/2)*(1/T_ramsey)*(1/par.E)*(1/sqrt(N_gooducndetected))*(1/alpha);

end