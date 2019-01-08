function F_uppercell = calcF_uppercell(par,E_hightopcell,E_lowtopcell,E_highsourceexit,E_lowsourceexit)

F_uppercell = ((E_hightopcell- par.V_LHe)^1.5-(E_lowtopcell- par.V_LHe)^1.5)/((E_highsourceexit - par.V_LHe)^1.5-(E_lowsourceexit - par.V_LHe)^1.5);

end