%I am currently checking this against a working version of the spreadsheet
%from RPicker: EDMsensitivity2019v01.xlsm from 
%https://ucn.triumf.ca/ucn-source/next-generation-ucn-source-1/detailed-design,
%the formulae do not match this sheet exactly, thats the next step.
par = genPar;
const = genConst;
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

T_phon = calcT_phon(par);%good, s

T_vapour = calcT_vapour(par);%good, s

Vol_guidevapour = calcVol_guidevapour(par);%needs looking at, answer is 1000 cm^3 high

Vol_guideLHe = calcVol_guideLHe(par);%ok, still a little low, cm^3

Vol_prod = calcVol_prod(par);%low, this formula assumes a cylindrical production volume, cm^3

alpha = calcalpha(par);%good

NDens_Hg = calcNDens_Hg(const,par);%good, m^-3

Vel_Hg = calcVel_Hg(const,par);%good, m/s

%%below here order matters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MFP_UCN = calcMFP_UCN(const,Vel_Hg,NDens_Hg);%good, m

T_HgAbs = calcT_HgAbs(MFP_UCN,Vel_Hg);%good, s

h_EDMguide = calch_EDMguide(h_guidesource,h_Hecont);%good, m

h_maxuppercell = calch_maxuppercell(h_EDMguide,dh_uppercell);%good, m

h_uppercell = calch_uppercell(par,h_guidesource,h_Hecont);%good, m

E_lowafterirrad = calcE_lowafterirrad(E_lowprod);%good, neV

E_lowsourceexit = calcE_lowsourceexit(const,E_lowafterirrad,h_guidesource,h_Hecont);%close, formula needs updating, neV

E_lowtopcell = calcE_lowtopcell(const,E_lowsourceexit,h_maxuppercell,h_uppercell);%good, neV

E_highsourceexit = calcE_highsourceexit(E_highafterirrad);%good, neV

E_hightopcell = calcE_hightopcell(const,par,E_highsourceexit,h_uppercell);%good

F_uppercell = calcF_uppercell(par,E_hightopcell,E_lowtopcell,E_highsourceexit,E_lowsourceexit);%close

h_bottomcell = calch_bottomcell(par,h_EDMguide);%good

E_lowbottomcell = calcE_lowbottomcell(const,E_lowsourceexit,h_bottomcell);%close, neV

h_minlowercell = calch_minlowercell(h_EDMguide,dh_lowercell);%good, m

E_highbottomcell = calcE_highbottomcell(const,par,E_highsourceexit,V_EDMguide,h_minlowercell,h_bottomcell);%good

F_lowercell = calcF_lowercell(par,E_highbottomcell,E_lowbottomcell,E_highsourceexit,E_lowsourceexit);%good

F_EDMcell = calcF_EDMcell(par,Vol_EDMcell,Vol_EDMguide,Vol_prod,Vol_guideLHe,Vol_guidevapour);%good

Eff_cellfill = calcEff_cellfill(par,F_EDMcell,F_lowercell,F_uppercell);%good

F_sourceexit = calcF_sourceexit(par,E_highsourceexit,E_lowsourceexit,E_highafterirrad,E_lowafterirrad);%good

F_source = calcF_source(par,E_highafterirrad,E_lowafterirrad,E_highprod,E_lowprod);%good

VolFrac_He = calcVolFrac_He(Vol_prod,Vol_guideLHe,Vol_guidevapour);%probably good

T_source = calcT_source(par,VolFrac_He,T_vapour,T_phon,T_3He);%close, low, s

T_irrad = calcT_irrad(par,T_source);%close, low because Tsource is low, s

N_afterirrad = calcN_afterirrad(par,T_source,T_irrad,F_source);%close, low

N_UCNt0 = calcN_UCNt0(N_afterirrad,F_sourceexit,Eff_cellfill);%close, low

N_after = calcN_after(par,N_UCNt0,T_HgAbs);%close, low

N_gooducndetected = calcN_gooducndetected(par,N_after);%close, low

S_perfill = calcS_perfill(const,par,T_ramsey,N_gooducndetected,alpha)