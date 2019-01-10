function L_preHEX = calcL_preHEX(par)

L_preHEX = 2.5 - (par.L_prod./2) - (par.d_prod./2) - (par.L_HEX/2);

end