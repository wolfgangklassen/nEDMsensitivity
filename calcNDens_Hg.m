function NDens_Hg = calcNDens_Hg(const,par)

NDens_Hg = const.Nav.*(par.P_Hg./const.R)./par.Temp_Hg;

end