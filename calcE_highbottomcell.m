function E_highbottomcell = calcE_highbottomcell(const,par,E_highsourceexit,V_EDMguide,h_minlowercell,h_bottomcell)

E_highbottomcell = min(E_highsourceexit,min((V_EDMguide+h_minlowercell*const.V_ngrav),(par.V_EDMcell + h_bottomcell*const.V_ngrav)));

end