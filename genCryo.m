function cryo = genCryo(const,par)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%All calulations related to cryogenics are collected here, with a separate
%object representing each separate tab in the excel sheet.  This is just in
%case variable names are too similar between sheets, and to compare more
%easily to the existing working code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%fTinverse%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cryo.fTinverse.t = const.cryo.HEPAKtable(:,1)./const.cryo.Temp_lambda;

cryo.fTinverse.RP = const.cryo.g.*((cryo.fTinverse.t.^(5.7)).*...
    (1-((cryo.fTinverse.t.^(5.7))))).^3;

cryo.fTinverse.TO_RP = const.cryo.HEPAKtable(:,3)./cryo.fTinverse.RP;

cryo.fTinverse.HEPAKcumsum = cumsum(const.cryo.HEPAKtable(:,2)).*...
    (const.cryo.HEPAKtable(2,1) - const.cryo.HEPAKtable(1,1));

cryo.fTinverse.VanScivercumsum = cumsum(const.cryo.HEPAKtable(:,3)).*...
    (const.cryo.HEPAKtable(2,1) - const.cryo.HEPAKtable(1,1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%3HePumping%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cryo.pumping.latentHeat = const.He.He3LatentHeatTable(:,2)./1000.*3;

cryo.pumping.SVP = calcSVP(const);

cryo.pumping.coolingPower = cryo.pumping.latentHeat.*max(0,cryo.pumping.SVP-const.cryo.pressureDrop)./...
    1000.*const.cryo.pumpingSpeed./(const.R./100000)./const.roomTemp.*const.cryo.Eff_JT;

cryo.pumping.h_k3HeCu = (const.He.He3LatentHeatTable(:,1).^3).*const.cryo.Kapitza.*20./const.cryo.Kapitza_corr;

cryo.pumping.Surf_3HeCu = calcSurf_3HeCu(par);%correct

cryo.pumping.delta_T1 = cryo.pumping.coolingPower./cryo.pumping.h_k3HeCu./cryo.pumping.Surf_3HeCu;%correct

cryo.pumping.T_HEX = const.He.He3LatentHeatTable(:,1) + cryo.pumping.delta_T1;%correct

cryo.pumping.h_kNiHeII = (cryo.pumping.T_HEX.^3).*const.cryo.Kapitza.*20;%correct numbers, but does not currently include any fudge factors.

cryo.pumping.Surf_IsoNi = calcSurf_IsoNi(par);

cryo.pumping.delta_T2 = cryo.pumping.coolingPower./cryo.pumping.h_kNiHeII./cryo.pumping.Surf_IsoNi;%correct

cryo.pumping.T_HeIIlow = cryo.pumping.T_HEX + cryo.pumping.delta_T2;

XSec_area = calcXSec_area(par);

L_channel = calcL_channel(par);

for i = 1:length(cryo.pumping.T_HeIIlow)
    [~,ind1] = min(abs(const.cryo.HEPAKtable(:,1) - cryo.pumping.T_HeIIlow(i)));
    oldintegral = cryo.fTinverse.VanScivercumsum(ind1);
    newintegral = oldintegral + (cryo.pumping.coolingPower(i)./XSec_area).^3.*L_channel;
    [~,ind2] = min(abs(cryo.fTinverse.VanScivercumsum - newintegral));
    cryo.pumping.T_HeIIhigh(i,1) = const.cryo.HEPAKtable(ind2,1);
end
%T_HeIIhigh is very close to the excel sheet answer, remaining differences
%may be in the search function used in the integral tables, and frankly I 
%understand mine better so I'm inclined to trust it.
%cryo.pumping.total_dT = cryo.pumping.T_HeIIhigh - const.He.He3LatentHeatTable(:,1);
%i dont know why dT is calculated, I don't need it anywhere.
end