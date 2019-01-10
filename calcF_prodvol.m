function F_prodvol = calcF_prodvol(Vol_prod,Vol_guideLHe,Vol_guidevapour)

F_prodvol = Vol_prod./(Vol_prod + Vol_guideLHe + Vol_guidevapour);

end