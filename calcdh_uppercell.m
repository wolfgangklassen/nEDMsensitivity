function dh_uppercell = calcdh_uppercell(par)

dh_uppercell = 1.5*par.h_elec + par.h_EDMcell + par.d_cellguide + (par.d_EDMguide/2);

end