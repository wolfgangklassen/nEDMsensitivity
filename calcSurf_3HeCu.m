function Surf_3HeCu = calcSurf_3HeCu(par)

cylinder = (par.d_HEX./2 + par.thickness_HEX).*2.*pi.*par.L_HEX.*...
    (par.HEXfin_length - par.HEXfin_width)./par.HEXfin_length;

fin_sides = (((par.d_HEX./2 + par.thickness_HEX + par.HEXfin_length).^2 - ...
    (par.d_HEX./2 + par.thickness_HEX).^2).*pi).*par.numfins.*2;

fin_tops = (par.d_HEX./2 + par.thickness_HEX + par.HEXfin_length).*...
    2.*pi.*par.HEXfin_width./par.HEXfin_pitch.*par.L_HEX;

Surf_3HeCu = cylinder + fin_sides + fin_tops;

end