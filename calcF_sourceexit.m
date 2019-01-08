function F_sourceexit = calcF_sourceexit(par,E_highsourceexit,E_lowsourceexit,E_highafterirrad,E_lowafterirrad)

F_sourceexit = ((E_highsourceexit - par.V_LHe)^1.5-(E_lowsourceexit - par.V_LHe)^1.5)/((E_highafterirrad - par.V_LHe)^1.5-(E_lowafterirrad - par.V_LHe)^1.5);

end