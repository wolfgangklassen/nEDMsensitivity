function T_3He = calcT_3He(const)

T_3He = (const.He.NDens_LHe*const.He.Prop_3He*const.He.XSec_3He*1e-22*2200)^-1;

end