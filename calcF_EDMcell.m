function F_EDMcell = calcF_EDMcell(par,Vol_EDMcell,Vol_EDMguide,Vol_prod,Vol_guideLHe,Vol_guidevapour)

F_EDMcell = (Vol_EDMcell*par.n_cells)/(Vol_EDMcell*par.n_cells + Vol_EDMguide + Vol_prod + Vol_guideLHe + Vol_guidevapour);

end