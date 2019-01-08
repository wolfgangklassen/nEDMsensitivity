function MFP_UCN = calcMFP_UCN(const,Vel_Hg,NDens_Hg)

MFP_UCN = (Vel_Hg)/(const.Hg.XSec_Hg*NDens_Hg*2200*1e-28);

end