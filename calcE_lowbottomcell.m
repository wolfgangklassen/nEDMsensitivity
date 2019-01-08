function E_lowbottomcell = calcE_lowbottomcell(const,E_lowsourceexit,h_bottomcell)

E_lowbottomcell = max(E_lowsourceexit,(h_bottomcell*const.V_ngrav));

end