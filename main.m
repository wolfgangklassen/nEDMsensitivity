
par = genPar;
const = genConst;
%%calculate quantities that only dend on par/const%%%%%%%%%%%%%%%%%%%%%%%%%

dh_uppercell = calcdh_uppercell(par);%good

dh_lowercell = calcdh_lowercell(par);%good

V_EDMguide = calcV_EDMguide(par);%good

Vol_EDMguide = calcVol_EDMguide(par);%good

Vol_EDMcell = calcVol_EDMcell(par);%answer is correct, in cm^3

h_Hecont = calch_Hecont(par);%%answer is low by 0.1 m, excel sheet may be wrong

h_guidesource = calch_guidesource(par);

E_lowprod = calcE_lowprod(par);

E_highafterirrad = calcE_highafterirrad(par);

E_highprod = calcE_highprod(par);

T_ramsey = calcT_ramsey(par);

T_3He = calcT_3He(const);

T_phon = calcT_phon(par);

T_vapour = calcT_vapour(par);

Vol_guidevapour = calcVol_guidevapour(par);

Vol_guideLHe = calcVol_guideLHe(par);

Vol_prod = calcVol_prod(par);

alpha = calcalpha(par);

NDens_Hg = calcNDens_Hg(const,par);

Vel_Hg = calcVel_Hg(const,par);

%%below here order matters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MFP_UCN = calcMFP_UCN(const,Vel_Hg,NDens_Hg);

T_HgAbs = calcT_HgAbs(MFP_UCN,Vel_Hg);

h_EDMguide = calch_EDMguide(h_guidesource,h_Hecont);

h_maxuppercell = calch_maxuppercell(h_EDMguide,dh_uppercell);

h_uppercell = calch_uppercell(par,h_guidesource,h_Hecont);

E_lowafterirrad = calcE_lowafterirrad(E_lowprod);

E_lowsourceexit = calcE_lowsourceexit(const,E_lowafterirrad,h_guidesource,h_Hecont);

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

T_source = calcT_source(par,VolFrac_He,T_vapour,T_phon,T_3He);

T_irrad = calcT_irrad(par,T_source);

N_afterirrad = calcN_afterirrad(par,T_source,T_irrad,F_source);

N_UCNt0 = calcN_UCNt0(N_afterirrad,F_sourceexit,Eff_cellfill);

N_after = calcN_after(par,N_UCNt0,T_HgAbs);

N_gooducndetected = calcN_gooducndetected(par,N_after);

S_perfill = calcS_perfill(const,par,T_ramsey,N_gooducndetected,alpha)