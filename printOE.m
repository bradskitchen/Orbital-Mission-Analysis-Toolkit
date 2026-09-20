function printOE(oe,E,H)
    %a,e_mag,i,RAAN,omega,nu];
    fprintf("Semi-major Axis = %.4f km\n", oe(1));
    fprintf("Eccentricity = %.4f\n",oe(2));
    fprintf("Inclination = %.4f deg\n",oe(3));
    fprintf("Right Ascension of the Ascending Node = %.4f deg\n", oe(4));
    fprintf("Argument of Periapsis = %.4f deg\n", oe(5));
    fprintf("True Anomaly = %.4f deg\n", oe(6));
    fprintf("Specific Orbital Energy = %.6f km^2/s^2\n",E);
    fprintf("Angular Momentum Vector (km^2/s):\n");
    fprintf("%.6f\n%.6f\n%.6f\n",H(1),H(2),H(3));
end
