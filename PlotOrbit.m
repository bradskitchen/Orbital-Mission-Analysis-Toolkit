function PlotOrbit(oe,name)
    a=oe(1);
    e=oe(2);
    i=deg2rad(oe(3));
    RAAN=deg2rad(oe(4));
    omega=deg2rad(oe(5));
    nuCurrent=deg2rad(oe(6));

    if e < 1
        if a <= 0
            error("An elliptical orbit requires a positive semi-major axis.");
        end
        nu=linspace(0,2*pi,500);
    elseif e > 1
        if a >= 0
            error("A hyperbolic orbit requires a negative semi-major axis.");
        end
        nuLimit=0.98*acos(-1/e);
        nu=linspace(-nuLimit,nuLimit,500);
    else
        error("A parabolic orbit cannot be plotted from classical elements containing infinite semi-major axis.");
    end

    p=a*(1-e^2);
    r=p./(1+e*cos(nu));
    perifocal=[r.*cos(nu);r.*sin(nu);zeros(size(nu))];

    cr=cos(RAAN); sr=sin(RAAN);
    co=cos(omega); so=sin(omega);
    ci=cos(i); si=sin(i);
    transform=[cr*co-sr*ci*so, -cr*so-sr*ci*co, sr*si;
               sr*co+cr*ci*so, -sr*so+cr*ci*co, -cr*si;
               si*so, si*co, ci];

    orbitECI=transform*perifocal;
    rCurrent=p/(1+e*cos(nuCurrent));
    currentECI=transform*[rCurrent*cos(nuCurrent);rCurrent*sin(nuCurrent);0];

    figure;
    plot3(orbitECI(1,:),orbitECI(2,:),orbitECI(3,:),'b', ...
          'LineWidth',1.5,'DisplayName','Orbit');
    hold on;
    scatter3(0,0,0,120,'filled','MarkerFaceColor',[0.4 0.7 1], ...
             'MarkerEdgeColor','k','DisplayName',char(name));
    scatter3(currentECI(1),currentECI(2),currentECI(3),60,'r','filled', ...
             'DisplayName','Current Position');
    xlabel('ECI x Position (km)');
    ylabel('ECI y Position (km)');
    zlabel('ECI z Position (km)');
    title(sprintf('%s-Centered Orbit',char(name)));
    legend('Location','best');
    axis equal;
    grid on;
    view(35,25);
    hold off;
end
