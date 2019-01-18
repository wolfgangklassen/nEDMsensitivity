function E_lowsourceexit = calcE_lowsourceexit(const,par,E_lowafterirrad,h_guidesource,h_Hecont)

E_lowsourceexit = max(E_lowafterirrad,...
    max(const.V_ngrav.*(h_guidesource + h_Hecont + (par.d_preHEX - par.d_guideVapour)./2),...
    (const.He.V_LHe + const.V_ngrav.*(par.d_prod + par.h_LHe))));

end