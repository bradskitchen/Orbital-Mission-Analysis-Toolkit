function printPatchedConic(out,name1,name2)
    fprintf("\nPATCHED-CONIC RESULTS\n");
    fprintf("Mission: %s to %s\n",char(name1),char(name2));
    fprintf("Departure Escape Delta V: %.5f km/s\n",out(1));
    fprintf("Arrival Capture Delta V: %.5f km/s\n",out(2));
    fprintf("Total Delta V: %.5f km/s\n",out(3));
    fprintf("Departure V Infinity: %.5f km/s\n",out(4));
    fprintf("Arrival V Infinity: %.5f km/s\n",out(5));
    fprintf("Departure Turning Angle: %.3f deg\n",out(6));
    fprintf("Arrival Turning Angle: %.3f deg\n",out(7));
    fprintf("Departure Hyperbola Eccentricity: %.5f\n",out(8));
    fprintf("Arrival Hyperbola Eccentricity: %.5f\n",out(9));
    fprintf("Transfer Time: %.3f days\n",out(10));
end
