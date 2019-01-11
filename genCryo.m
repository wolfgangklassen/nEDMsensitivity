function cryo = genCryo(const)
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

%cryo.pumping.coolingPower = cryo.pumping.latentHeat.*max(0,cryo.pumping.SVP-Q4)./...
%    1000.*Parameters.B7./Parameters.B3./Parameters.B4.*R4;


end