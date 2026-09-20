function printPlaneChange(out,di)
    fprintf("\nPLANE CHANGE RESULTS\n");
    fprintf("Total Inclination Change: %.3f deg\n",di);
    fprintf("Single-Impulse Delta V: %.5f km/s\n",out(1));

    if numel(out) >= 2
        fprintf("Split Plane-Change Delta V: %.5f km/s\n",out(2));
        fprintf("Split Savings: %.5f km/s\n",out(1)-out(2));
    end
    if numel(out) >= 3
        fprintf("Optimum Plane-Change Delta V: %.5f km/s\n",out(3));
        fprintf("Savings from Single Impulse: %.5f km/s\n",out(1)-out(3));
        fprintf("Savings from Equal Split: %.5f km/s\n",out(2)-out(3));
    end
    if numel(out) >= 7
        fprintf("Optimum First-Burn Inclination Change: %.3f deg\n",out(4));
        fprintf("Optimum Second-Burn Inclination Change: %.3f deg\n",out(5));
        fprintf("Transfer Delta V without Plane Change: %.5f km/s\n",out(6));
        fprintf("Best Single-Impulse Location: Transfer Burn %.0f\n",out(7));
    end
end
