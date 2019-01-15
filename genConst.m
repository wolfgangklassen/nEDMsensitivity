function const = genConst
%%populates the constants object%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%universal constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
const.hbar = 6.71E-16;
const.V_ngrav = 102.554472910481;
const.R = 8.31;%44598;
const.Nav = 6.02E+23;
const.nMass = 1.674927351E-027;% kg
const.elec = 1.602176565E-019;
const.roomTemp = 300; %K

%%Helium constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
const.He.NDens_LHe = 2.1901E+22;
const.He.Prop_3He = 1.00E-11;
const.He.XSec_3He = 5333;
const.He.V_LHe = 18.53; % neV
const.He.UpscatteringMatrix = cell2mat(struct2cell(load("HeVapourUpscatteringMatrix")));
const.He.LHeTempIndex = cell2mat(struct2cell(load("LHeIIIndexArray")));
const.He.He3LatentHeatTable = cell2mat(struct2cell(load("He3LatentHeatTable")));

%%Mercury constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
const.Hg.XSec_Hg = 2.15E+01;
const.Hg.m_Hg = 1.29E-01;

%%Cryo constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
const.cryo.S_lambda = 1559;
const.cryo.Temp_lambda = 2.172;
const.cryo.A_lambda = 1450;
const.cryo.rho = 145;
const.cryo.g = (const.cryo.rho.^2).*(const.cryo.S_lambda.^4).*...
    (const.cryo.Temp_lambda.^3)./(const.cryo.A_lambda);
const.cryo.HEPAKtable = cell2mat(struct2cell(load("HEPAK_VanSciver_Table")));
const.cryo.a = -2.50943;
const.cryo.b = 2.25484;
const.cryo.c = 9.70876;
const.cryo.d = -0.304433;
const.cryo.e = 0.210429;
const.cryo.f = -0.0545145;
const.cryo.g = 0.0056067;
const.cryo.pressureDrop = 0.04;% mbar
const.cryo.pumpingSpeed = 10000./3600; %m^3s^-1
const.cryo.Eff_JT = 0.83;
const.cryo.Kapitza = 35;
const.cryo.Kapitza_corr = 2.6;
end