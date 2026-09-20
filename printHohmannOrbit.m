function printHohmannOrbit(out,name,m0,Isp,fuelMass)
    fprintf("\nHOHMANN TRANSFER RESULTS\n");
    fprintf("Central Body: %s\n",char(name));
    fprintf("Initial Orbit Radius: %.3f km\n",out(5));
    fprintf("Final Orbit Radius: %.3f km\n",out(6));
    fprintf("Transfer Semi-Major Axis: %.3f km\n",out(7));
    fprintf("First Burn Delta V: %.5f km/s\n",out(1));
    fprintf("Second Burn Delta V: %.5f km/s\n",out(2));
    fprintf("Total Delta V: %.5f km/s\n",out(3));
    fprintf("Transfer Time: %.3f hr\n",out(4));
    fprintf("Initial Circular Velocity: %.5f km/s\n",out(8));
    fprintf("Final Circular Velocity: %.5f km/s\n",out(9));
    fprintf("Initial Transfer Velocity: %.5f km/s\n",out(10));
    fprintf("Final Transfer Velocity: %.5f km/s\n",out(11));
    fprintf("Initial Spacecraft Mass: %.3f kg\n",m0);
    fprintf("Specific Impulse: %.3f s\n",Isp);
    fprintf("Required Fuel Mass: %.3f kg\n",fuelMass);
    fprintf("Final Spacecraft Mass: %.3f kg\n",m0-fuelMass);
end
