function Vel_nvapourMin = calcVel_nvapourMin(const,E_lowbottomcell,h_guidesource,h_Hecont)

Vel_nvapourMin = sqrt(2.*(E_lowbottomcell + ( -h_guidesource - h_Hecont)...
    .*const.V_ngrav).*0.000000001.*const.elec./const.nMass);

end