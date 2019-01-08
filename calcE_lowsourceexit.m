function E_lowsourceexit = calcE_lowsourceexit(const,E_lowafterirrad,h_guidesource,h_Hecont)

E_lowsourceexit = max(E_lowafterirrad,(h_guidesource + h_Hecont)*const.V_ngrav);

end