function alpha = calcalpha(par)

alpha = par.alpha_0*exp((-par.T_EDM/par.T_2)-((par.T_wait + 2*par.T_pulse)/par.T_1))*par.Emptyingloss*par.Analysingpower;

end