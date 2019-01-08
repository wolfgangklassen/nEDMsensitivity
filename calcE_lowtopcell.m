function E_lowtopcell = calcE_lowtopcell(const,E_lowsourceexit,h_maxuppercell,h_uppercell)

E_lowtopcell = max((E_lowsourceexit),max((h_maxuppercell*const.V_ngrav),(h_uppercell*const.V_ngrav)));

end