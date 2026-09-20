function [departure,arrival] = PhaseAngle(r1,r2)
    global mu_sun
    at=(r1+r2)/2;
    tof = pi*sqrt((at^3)/mu_sun);
    n1=sqrt(mu_sun/(r1^3));
    n2=sqrt(mu_sun/(r2^3));
    departure=mod(180-rad2deg(n2*tof),360);
    arrival=mod(180-rad2deg(n1*tof),360);
end
