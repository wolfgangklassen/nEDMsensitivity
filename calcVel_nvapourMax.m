function Vel_nvapourMax = calcVel_nvapourMax(const,E_hightopcell,h_guidesource,h_Hecont)

Vel_nvapourMax = sqrt(2.*(E_hightopcell + ( -h_guidesource - h_Hecont).*const.V_ngrav)...
    .*0.000000001.*const.elec./const.nMass);

end