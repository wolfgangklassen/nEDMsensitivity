function E_hightopcell = calcE_hightopcell(const,par,E_highsourceexit,h_uppercell)

E_hightopcell = min(E_highsourceexit,(par.V_EDMcell + h_uppercell*const.V_ngrav));

end