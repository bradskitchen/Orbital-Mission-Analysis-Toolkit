function PlotHohmann(ap1, ap2, phase, p1, p2)
    at=(ap1+ap2)/2;
    theta = linspace(0, 2*pi, 360);
    e = abs(ap2-ap1)/(ap1+ap2);
    if ap2 > ap1
        theta_transfer = linspace(0, pi, 200);
    else
        theta_transfer = linspace(pi, 2*pi, 200);
    end
    
    r_transfer = at*(1-e^2)./(1+e*cos(theta_transfer));
    x_transfer = r_transfer.*cos(theta_transfer);
    y_transfer = r_transfer.*sin(theta_transfer);
    departure_x = ap1;
    departure_y = 0;
    arrival_x = ap2*cosd(phase);
    arrival_y = ap2*sind(phase);
    
    figure;
    hold on;
    plot(ap1*cos(theta), ap1*sin(theta), 'b', 'LineWidth', 1.2, 'DisplayName', p1 + " Orbit");
    plot(ap2*cos(theta), ap2*sin(theta), 'r', 'LineWidth', 1.2, 'DisplayName', p2 + " Orbit");
    plot(x_transfer, y_transfer, 'g--', 'LineWidth', 2, 'DisplayName', 'Hohmann Transfer Orbit');
    scatter(departure_x, departure_y, 60, 'b', 'filled', 'DisplayName', p1 + " at Departure");
    scatter(arrival_x, arrival_y, 60, 'r', 'filled', 'DisplayName', p2 + " at Departure");
    scatter(0, 0, 120, 'y', 'filled', 'MarkerEdgeColor', 'k', 'DisplayName', 'Sun');
    %add arrow to show direction
    plot(0, ap2, '<r', 'MarkerSize', 10, 'MarkerFaceColor', 'r', 'HandleVisibility', 'off');
    if ap2 > ap1
        plot(0, at*(1-e^2), '<g', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'HandleVisibility', 'off');
    else
        plot(0, -at*(1-e^2), '>g', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'HandleVisibility', 'off');
    end
    plot(0, ap1, '<b', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'HandleVisibility', 'off');
    xlabel('x Position (km)');
    ylabel('y Position (km)');
    axis equal;
    grid on;
    legend('Location', 'best');
    title(sprintf('%s to %s Hohmann Transfer', p1, p2));
    hold off;
end
