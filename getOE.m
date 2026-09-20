function oe = getOE()
    %a,e_mag,i,RAAN,omega,nu];
    fprintf("Please Input your Orbital Elements\n");
    a=input("Semi-major axis (km): \n");
    e=input("Eccentricity (unitless): \n");
    i=input("Inclination (deg): \n");
    RAAN=input("Right ascension of the ascending node (deg): \n");
    omega=input("Argument of periapsis (deg): \n");
    nu=input("True anomaly (deg): \n");
    oe = [a,e,i,RAAN,omega,nu];
end
