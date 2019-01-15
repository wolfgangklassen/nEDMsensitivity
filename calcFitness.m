function fitness = calcFitness(const,par,cryo)

dh_uppercell = calcdh_uppercell(par);

dh_lowercell = calcdh_lowercell(par);

V_EDMguide = calcV_EDMguide(par);

Vol_EDMguide = calcVol_EDMguide(par);

Vol_EDMcell = calcVol_EDMcell(par);

h_Hecont = calch_Hecont(par);

h_guidesource = calch_guidesource(par);

E_lowprod = calcE_lowprod(par);

E_highafterirrad = calcE_highafterirrad(par);

E_highprod = calcE_highprod(par);

T_ramsey = calcT_ramsey(par);

T_3He = calcT_3He(const);

Vol_guidevapour = calcVol_guidevapour(par);

Vol_prod = calcVol_prod(par);

alpha = calcalpha(par);

NDens_Hg = calcNDens_Hg(const,par);

Vel_Hg = calcVel_Hg(const,par);

L_preHEX = calcL_preHEX(par);

Vol_HEX = calcVol_HEX(par);

Vol_postHEX = calcVol_postHEX(par);

Surf_prod = calcSurf_prod(par);

Surf_HEX = calcSurf_HEX(par);

Surf_postHEX = calcSurf_postHEX(par);

Surf_guidevapour = calcSurf_guidevapour(par);

%%%%%%%%%%%%below here order of calulation matters%%%%%%%%%%%%%%%%%%%%%%%%%

Vol_preHEX = calcVol_preHEX(par,L_preHEX);

Vol_guideLHe = calcVol_guideLHe(Vol_preHEX,Vol_HEX,Vol_postHEX);

MFP_UCN = calcMFP_UCN(const,Vel_Hg,NDens_Hg);

T_HgAbs = calcT_HgAbs(MFP_UCN,Vel_Hg);

h_EDMguide = calch_EDMguide(h_guidesource,h_Hecont);

h_maxuppercell = calch_maxuppercell(h_EDMguide,dh_uppercell);

h_uppercell = calch_uppercell(par,h_guidesource,h_Hecont);

E_lowafterirrad = calcE_lowafterirrad(E_lowprod);

E_lowsourceexit = calcE_lowsourceexit(const,par,E_lowafterirrad,h_guidesource,h_Hecont);

E_lowtopcell = calcE_lowtopcell(const,E_lowsourceexit,h_maxuppercell,h_uppercell);

E_highsourceexit = calcE_highsourceexit(E_highafterirrad);

E_hightopcell = calcE_hightopcell(const,par,E_highsourceexit,h_uppercell);

F_uppercell = calcF_uppercell(par,E_hightopcell,E_lowtopcell,E_highsourceexit,E_lowsourceexit);

h_bottomcell = calch_bottomcell(par,h_EDMguide);

E_lowbottomcell = calcE_lowbottomcell(const,E_lowsourceexit,h_bottomcell);

h_minlowercell = calch_minlowercell(h_EDMguide,dh_lowercell);

E_highbottomcell = calcE_highbottomcell(const,par,E_highsourceexit,V_EDMguide,h_minlowercell,h_bottomcell);

F_lowercell = calcF_lowercell(par,E_highbottomcell,E_lowbottomcell,E_highsourceexit,E_lowsourceexit);

F_EDMcell = calcF_EDMcell(par,Vol_EDMcell,Vol_EDMguide,Vol_prod,Vol_guideLHe,Vol_guidevapour);

Eff_cellfill = calcEff_cellfill(par,F_EDMcell,F_lowercell,F_uppercell);

F_sourceexit = calcF_sourceexit(par,E_highsourceexit,E_lowsourceexit,E_highafterirrad,E_lowafterirrad);

F_source = calcF_source(par,E_highafterirrad,E_lowafterirrad,E_highprod,E_lowprod);

VolFrac_He = calcVolFrac_He(Vol_prod,Vol_guideLHe,Vol_guidevapour);

F_prodvol = calcF_prodvol(Vol_prod,Vol_guideLHe,Vol_guidevapour);

Vol_source = calcVol_source(Vol_prod,Vol_guideLHe,Vol_guidevapour);

F_postHEXvol = calcF_postHEXvol(Vol_postHEX,Vol_source);

Vel_nvapourMax = calcVel_nvapourMax(const,E_hightopcell,h_guidesource,h_Hecont);

Vel_nvapourMin = calcVel_nvapourMin(const,E_lowbottomcell,h_guidesource,h_Hecont);

Vel_afterirradAvg = calcVel_afterirradAvg(Vel_nvapourMax,Vel_nvapourMin);

Vel_ncellAvg = calcVel_ncellAvg(const,Vel_afterirradAvg,h_Hecont);

F_preHEXvol = calcF_preHEXvol(Vol_preHEX,Vol_source);

Surf_preHEX = calcSurf_preHEX(par,L_preHEX);

F_HEXvol = calcF_HEXvol(Vol_HEX,Vol_source);

F_vapourVol = calcF_vapourVol(Vol_guidevapour,Vol_source);

mu_afterirrad = calcmu_afterirrad(par,Vel_ncellAvg,F_prodvol,Surf_prod,...
    Vol_prod,F_preHEXvol,Surf_preHEX,Vol_preHEX,F_HEXvol,Surf_HEX,...
    Vol_HEX,F_postHEXvol,Surf_postHEX,Vol_postHEX,F_vapourVol,...
    Surf_guidevapour,Vol_guidevapour,Vel_afterirradAvg);

T_wall = calcT_wall(mu_afterirrad,Vel_ncellAvg,F_prodvol,Surf_prod,...
    Vol_prod,F_preHEXvol,Surf_preHEX,Vol_preHEX,F_HEXvol,Surf_HEX,Vol_HEX,...
    F_postHEXvol,Surf_postHEX,Vol_postHEX,F_vapourVol,Surf_guidevapour,...
    Vol_guidevapour,Vel_afterirradAvg);

totalHeatLoad = calctotalHeatLoad(par);

[~,ind] = min(abs(cryo.pumping.coolingPower-totalHeatLoad));

% Temp_3Hehi = const.He.He3LatentHeatTable(ind,1);
% 
% Temp_3Helo = const.He.He3LatentHeatTable(ind-1,1);
% 
% Temp_3HeInt = calcTemp_3HeInt(par,cryo,ind,Temp_3Helo,Temp_3Hehi);

% Temp_HEXhi = cryo.pumping.T_HEX(ind);
% 
% Temp_HEXlo = cryo.pumping.T_HEX(ind-1);
% 
% Temp_HEXInt = calcTemp_HEXInt(par,cryo,ind,Temp_HEXlo,Temp_HEXhi);

Temp_isohi = cryo.pumping.T_HeIIlow(ind);

Temp_isolo = cryo.pumping.T_HeIIlow(ind-1);

Temp_isoInt = calcTemp_isoInt(par,cryo,ind,Temp_isolo,Temp_isohi);

Temp_prodhi = cryo.pumping.T_HeIIhigh(ind);

Temp_prodlo = cryo.pumping.T_HeIIhigh(ind-1);

Temp_prodInt = calcTemp_prodInt(par,cryo,ind,Temp_prodlo,Temp_prodhi);

Temp_HeII = calcTemp_HeII(Temp_isoInt,Temp_prodInt);

T_phon = calcT_phon(par,Temp_HeII);

T_vapour = calcT_vapour(const,par,Temp_HeII);

T_source = calcT_source(par,F_prodvol,F_postHEXvol,T_phon,T_vapour,T_3He,T_wall);

T_irrad = calcT_irrad(par,T_source);

N_afterirrad = calcN_afterirrad(par,T_source,T_irrad,F_source);

N_UCNt0 = calcN_UCNt0(N_afterirrad,F_sourceexit,Eff_cellfill);

N_after = calcN_after(par,N_UCNt0,T_HgAbs);

N_gooducndetected = calcN_gooducndetected(par,N_after);

fitness = calcS_perfill(const,par,T_ramsey,N_gooducndetected,alpha);

end