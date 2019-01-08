function h_uppercell = calch_uppercell(par,h_guidesource,h_Hecont)

h_uppercell = h_guidesource + h_Hecont + (par.h_elec/2);

end