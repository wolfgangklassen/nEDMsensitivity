function h_bottomcell = calch_bottomcell(par,h_EDMguide)

h_bottomcell = h_EDMguide + (par.d_EDMguide/2) - (par.h_elec/2) - par.h_EDMcell;

end