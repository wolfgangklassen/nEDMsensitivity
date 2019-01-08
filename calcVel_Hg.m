function Vel_Hg = calcVel_Hg(const,par)

Vel_Hg = sqrt((8*const.R*par.Temp_Hg)/(const.Hg.m_Hg*pi));

end