function Surf_prod = calcSurf_prod(par)

Surf_prod = ((par.d_prod./2).^2.*pi.*4 + par.d_prod.*pi*par.L_prod).*10000;

end