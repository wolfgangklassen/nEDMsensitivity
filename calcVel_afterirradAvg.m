function Vel_afterirradAvg = calcVel_afterirradAvg(Vel_nvapourMax,Vel_nvapourMin)

Vel_afterirradAvg = (Vel_nvapourMax.^4 - Vel_nvapourMin.^4)./4./...
    (Vel_nvapourMax.^3 - Vel_nvapourMin.^3).*3;

end