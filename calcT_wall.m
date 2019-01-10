function T_wall = calcT_wall(mu_afterirrad,Vel_ncellAvg,F_prodvol,Surf_prod,Vol_prod,F_preHEXvol,Surf_preHEX,Vol_preHEX,F_HEXvol,Surf_HEX,Vol_HEX,F_postHEXvol,Surf_postHEX,Vol_postHEX,F_vapourVol,Surf_guidevapour,Vol_guidevapour,Vel_afterirradAvg)
%I'm pretty sure this equation is right, but it keeps giving exactly 50
%instead of 47.46 which seems very wierd.  There may be some rounding
%errors somewhere, but I dont knwo why it would give exactly 50, that seems
%very odd.
T_wall = ((4./mu_afterirrad)./(Vel_ncellAvg.*...
    (F_prodvol.*Surf_prod./Vol_prod + F_preHEXvol.*Surf_preHEX./Vol_preHEX + ...
    F_HEXvol.*Surf_HEX./Vol_HEX + F_postHEXvol.*Surf_postHEX./Vol_postHEX) + ...
    (F_vapourVol.*Surf_guidevapour.*Vel_afterirradAvg)./Vol_guidevapour)).*(1./100);

end