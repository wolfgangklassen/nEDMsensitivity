function VolFrac_He = calcVolFrac_He(Vol_prod,Vol_guideLHe,Vol_guidevapour)

VolFrac_He = (Vol_prod + Vol_guideLHe)/(Vol_prod + Vol_guideLHe + Vol_guidevapour);

end