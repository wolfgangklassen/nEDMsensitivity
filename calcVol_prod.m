function Vol_prod = calcVol_prod(par)

Vol_prod = ((4./3).*pi.*(par.d_prod./2).^3 + par.L_prod*pi*((par.d_prod./2)^2))*1e6;

end