function printHohmann(out,departurePhase,arrivalPhase,name1,name2)
    planeChange = out(3)-out(1)-out(2);

    fprintf("\nINTERPLANETARY HOHMANN TRANSFER\n");
    fprintf("Mission: %s to %s\n",char(name1),char(name2));
    fprintf("Departure Delta V: %.4f km/s\n",out(1));
    fprintf("Arrival Delta V: %.4f km/s\n",out(2));
    fprintf("Plane Change Delta V: %.4f km/s\n",planeChange);
    fprintf("Total Delta V: %.4f km/s\n",out(3));
    fprintf("Transfer Time: %.3f days\n",out(4));
    fprintf("Departure Phase Angle: %.3f deg\n",departurePhase);
    fprintf("Arrival Phase Angle: %.3f deg\n",arrivalPhase);
    fprintf("Transfer Semi-Major Axis: %.3f km\n",out(7));
    fprintf("Departure V Infinity: %.4f km/s\n",out(10));
    fprintf("Arrival V Infinity: %.4f km/s\n",out(11));
    fprintf("Departure Transfer Velocity: %.4f km/s\n",out(12));
    fprintf("Arrival Transfer Velocity: %.4f km/s\n",out(13));
end
