function T_ramsey = calcT_ramsey(par)

T_ramsey = par.T_EDM - 2*par.T_pulse - par.T_wait;

end