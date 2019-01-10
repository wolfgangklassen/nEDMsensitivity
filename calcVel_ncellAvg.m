function Vel_ncellAvg = calcVel_ncellAvg(const,Vel_afterirradAvg,h_Hecont)

Vel_ncellAvg = sqrt((0.5.*const.nMass.*Vel_afterirradAvg.^2./const.elec.*1000000000 ...
    - const.He.V_LHe + const.V_ngrav.*h_Hecont).*2.*0.000000001.*const.elec./const.nMass);

end