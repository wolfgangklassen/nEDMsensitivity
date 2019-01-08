function F_source = calcF_source(par,E_highafterirrad,E_lowafterirrad,E_highprod,E_lowprod)

F_source = ((E_highafterirrad - par.V_LHe)^1.5-(E_lowafterirrad - par.V_LHe)^1.5)/((E_highprod - par.V_LHe)^1.5-(E_lowprod - par.V_LHe)^1.5);

end