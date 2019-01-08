function F_lowercell = calcF_lowercell(par,E_highbottomcell,E_lowbottomcell,E_highsourceexit,E_lowsourceexit)

F_lowercell =...
    ((E_highbottomcell - par.V_LHe)^1.5-(E_lowbottomcell - par.V_LHe)^1.5)/...
    ((E_highsourceexit - par.V_LHe)^1.5-(E_lowsourceexit - par.V_LHe)^1.5);

end