function T_vapour = calcT_vapour(const,par)

M = const.He.UpscatteringMatrix;

ind1 = round(par.Temp_HeII);
ind2 = round(par.Temp_warm);
ind3 = find(const.He.LHeTempIndex == round(par.Temp_HeII,2));

T_vapour = (sum(M(ind1:ind2,ind3)).*(1)./(par.Temp_warm - par.Temp_HeII)).^-1;

end