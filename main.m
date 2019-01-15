%I am currently checking this against a working version of the spreadsheet
%from RPicker: EDMsensitivity2019v01.xlsm from
%https://ucn.triumf.ca/ucn-source/next-generation-ucn-source-1/detailed-design,
%the formulae do not match this sheet exactly, thats the next step.
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!%
%
%!!!!!!!!!!!!!!!!!!!!!!MATLAB INDEXES START AT 1!!!!!!!!!!!!!!!!!!!!!!!!!!%
%
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!%
%This code works pretty well now.  Still some minor discrepencies to ferret
%out (hah!).


%%generate parameters and constant
par = genPar;
const = genConst;
cryo = genCryo(const,par);
%%calculate quantities that only dend on par/const%%%%%%%%%%%%%%%%%%%%%%%%%

dh_uppercell = calcdh_uppercell(par);%good, m

dh_lowercell = calcdh_lowercell(par);%good, m

V_EDMguide = calcV_EDMguide(par);%good, neV

Vol_EDMguide = calcVol_EDMguide(par);%good, cm^3

Vol_EDMcell = calcVol_EDMcell(par);%good, cm^3

h_Hecont = calch_Hecont(par);%good, m

h_guidesource = calch_guidesource(par);%ok, m

E_lowprod = calcE_lowprod(par);%good, neV

E_highafterirrad = calcE_highafterirrad(par);%good, neV

E_highprod = calcE_highprod(par);%good, neV

T_ramsey = calcT_ramsey(par);%good, s

T_3He = calcT_3He(const);%good, s

Vol_guidevapour = calcVol_guidevapour(par);%good, cm^3

Vol_prod = calcVol_prod(par);%good, cm^3

NDens_Hg = calcNDens_Hg(const,par);%good, m^-3

Vel_Hg = calcVel_Hg(const,par);%good, m/s

L_preHEX = calcL_preHEX(par);%good, m

Vol_HEX = calcVol_HEX(par);%good, cm^3

Vol_postHEX = calcVol_postHEX(par);%good, cm^3

Surf_prod = calcSurf_prod(par);%good, cm^2

Surf_HEX = calcSurf_HEX(par);%good, cm^2

Surf_postHEX = calcSurf_postHEX(par);%good, cm^2

Surf_guidevapour = calcSurf_guidevapour(par);%good, cm^2

%%%%%%%%%%%%below here order of calulation matters%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = calcalpha(par,T_ramsey);%good

Vol_preHEX = calcVol_preHEX(par,L_preHEX);%good, cm^3

Vol_guideLHe = calcVol_guideLHe(Vol_preHEX,Vol_HEX,Vol_postHEX);%good, cm^3

MFP_UCN = calcMFP_UCN(const,Vel_Hg,NDens_Hg);%good, m

T_HgAbs = calcT_HgAbs(MFP_UCN,Vel_Hg);%good, s

h_EDMguide = calch_EDMguide(h_guidesource,h_Hecont);%good, m

h_maxuppercell = calch_maxuppercell(h_EDMguide,dh_uppercell);%good, m

h_uppercell = calch_uppercell(par,h_guidesource,h_Hecont);%good, m

E_lowafterirrad = calcE_lowafterirrad(E_lowprod);%good, neV

E_lowsourceexit = calcE_lowsourceexit(const,par,E_lowafterirrad,h_guidesource,h_Hecont);%good, neV

E_lowtopcell = calcE_lowtopcell(const,E_lowsourceexit,h_maxuppercell,h_uppercell);%good, neV

E_highsourceexit = calcE_highsourceexit(E_highafterirrad);%good, neV

E_hightopcell = calcE_hightopcell(const,par,E_highsourceexit,h_uppercell);%good

F_uppercell = calcF_uppercell(par,E_hightopcell,E_lowtopcell,E_highsourceexit,E_lowsourceexit);%good

h_bottomcell = calch_bottomcell(par,h_EDMguide);%good

E_lowbottomcell = calcE_lowbottomcell(const,E_lowsourceexit,h_bottomcell);%good, neV

h_minlowercell = calch_minlowercell(h_EDMguide,dh_lowercell);%good, m

E_highbottomcell = calcE_highbottomcell(const,par,E_highsourceexit,V_EDMguide,h_minlowercell,h_bottomcell);%good

F_lowercell = calcF_lowercell(par,E_highbottomcell,E_lowbottomcell,E_highsourceexit,E_lowsourceexit);%good

F_EDMcell = calcF_EDMcell(par,Vol_EDMcell,Vol_EDMguide,Vol_prod,Vol_guideLHe,Vol_guidevapour);%good

Eff_cellfill = calcEff_cellfill(par,F_EDMcell,F_lowercell,F_uppercell);%good

F_sourceexit = calcF_sourceexit(par,E_highsourceexit,E_lowsourceexit,E_highafterirrad,E_lowafterirrad);%good

F_source = calcF_source(par,E_highafterirrad,E_lowafterirrad,E_highprod,E_lowprod);%good

% VolFrac_He = calcVolFrac_He(Vol_prod,Vol_guideLHe,Vol_guidevapour);%probably good

F_prodvol = calcF_prodvol(Vol_prod,Vol_guideLHe,Vol_guidevapour);%good

Vol_source = calcVol_source(Vol_prod,Vol_guideLHe,Vol_guidevapour);%good

F_postHEXvol = calcF_postHEXvol(Vol_postHEX,Vol_source);%good

Vel_nvapourMax = calcVel_nvapourMax(const,E_hightopcell,h_guidesource,h_Hecont);%good

Vel_nvapourMin = calcVel_nvapourMin(const,E_lowbottomcell,h_guidesource,h_Hecont);%good

Vel_afterirradAvg = calcVel_afterirradAvg(Vel_nvapourMax,Vel_nvapourMin);%good

Vel_ncellAvg = calcVel_ncellAvg(const,Vel_afterirradAvg,h_Hecont);%good

F_preHEXvol = calcF_preHEXvol(Vol_preHEX,Vol_source);%good

Surf_preHEX = calcSurf_preHEX(par,L_preHEX);%good

F_HEXvol = calcF_HEXvol(Vol_HEX,Vol_source);%good

F_vapourVol = calcF_vapourVol(Vol_guidevapour,Vol_source);%good

mu_afterirrad = calcmu_afterirrad(par,Vel_ncellAvg,F_prodvol,Surf_prod,...
    Vol_prod,F_preHEXvol,Surf_preHEX,Vol_preHEX,F_HEXvol,Surf_HEX,...
    Vol_HEX,F_postHEXvol,Surf_postHEX,Vol_postHEX,F_vapourVol,...
    Surf_guidevapour,Vol_guidevapour,Vel_afterirradAvg);%good

%mu_afterirrad = 0.000795125208133104;%This allows me to match the spreadsheet exacty, to continue testing

T_wall = calcT_wall(mu_afterirrad,Vel_ncellAvg,F_prodvol,Surf_prod,...
    Vol_prod,F_preHEXvol,Surf_preHEX,Vol_preHEX,F_HEXvol,Surf_HEX,Vol_HEX,...
    F_postHEXvol,Surf_postHEX,Vol_postHEX,F_vapourVol,Surf_guidevapour,...
    Vol_guidevapour,Vel_afterirradAvg);

totalHeatLoad = calctotalHeatLoad(par);

[~,ind] = min(abs(cryo.pumping.coolingPower-totalHeatLoad));
%NB 'lo' and 'hi' here refer to the over/under estimation from selecting a
%row in the lookup table, not the physical position of any component
% Temp_3Hehi = const.He.He3LatentHeatTable(ind,1);%good
% 
% Temp_3Helo = const.He.He3LatentHeatTable(ind-1,1);%good
% 
% Temp_3HeInt = calcTemp_3HeInt(par,cryo,ind,Temp_3Helo,Temp_3Hehi);%good

% Temp_HEXhi = cryo.pumping.T_HEX(ind);%good
% 
% Temp_HEXlo = cryo.pumping.T_HEX(ind-1);%good
% 
% Temp_HEXInt = calcTemp_HEXInt(par,cryo,ind,Temp_HEXlo,Temp_HEXhi);%good

Temp_isohi = cryo.pumping.T_HeIIlow(ind);%good

Temp_isolo = cryo.pumping.T_HeIIlow(ind-1);%good

Temp_isoInt = calcTemp_isoInt(par,cryo,ind,Temp_isolo,Temp_isohi);%good

Temp_prodhi = cryo.pumping.T_HeIIhigh(ind);%good

Temp_prodlo = cryo.pumping.T_HeIIhigh(ind-1);%good

Temp_prodInt = calcTemp_prodInt(par,cryo,ind,Temp_prodlo,Temp_prodhi);%good

Temp_HeII = calcTemp_HeII(Temp_isoInt,Temp_prodInt);%good

T_phon = calcT_phon(par,Temp_HeII);%good, s

T_vapour = calcT_vapour(const,par,Temp_HeII);%good, s

T_source = calcT_source(par,F_prodvol,F_postHEXvol,T_phon,T_vapour,T_3He,T_wall);% close, slightly high since T_wall is slightly high, s

T_irrad = calcT_irrad(par,T_source);%close, slightly high as above, s

N_afterirrad = calcN_afterirrad(par,T_source,T_irrad,F_source);%close, high as above

N_UCNt0 = calcN_UCNt0(N_afterirrad,F_sourceexit,Eff_cellfill);%close, high as above

N_after = calcN_after(par,N_UCNt0,T_HgAbs);%close, high as above

N_gooducndetected = calcN_gooducndetected(par,N_after);%close, high as above

S_perfill = calcS_perfill(const,par,T_ramsey,N_gooducndetected,alpha)%Now correctish