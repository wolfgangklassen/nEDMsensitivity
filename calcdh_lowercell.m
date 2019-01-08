function dh_lowercell = calcdh_lowercell(par)

dh_lowercell = (-par.d_EDMguide/2)-(3/2)*(par.h_elec/2) - par.h_EDMcell - par.d_cellguide;

end