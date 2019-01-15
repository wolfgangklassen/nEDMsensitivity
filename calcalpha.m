function alpha = calcalpha(par,T_ramsey)

alpha = par.alpha_0*exp((-T_ramsey/par.T_2)-((par.T_wait + 2*par.T_pulse)/par.T_1))*par.Emptyingloss*par.Analysingpower;

end