function Eff_cellfill = calcEff_cellfill(par,F_EDMcell,F_lowercell,F_uppercell)

Eff_cellfill = par.Tr_window*(par.Tr_permeter^par.L_EDMguide)*F_EDMcell*(par.Tr_bend^par.n_bends)*((F_lowercell + F_uppercell)/2);

end