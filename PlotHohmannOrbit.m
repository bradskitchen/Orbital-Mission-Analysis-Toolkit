function PlotHohmannOrbit(out,name)
    r1=out(5);
    r2=out(6);
    a=out(7);
    e=abs(r2-r1)/(r1+r2);
    b=a*sqrt(1-e^2);
    theta=linspace(0,2*pi,360);

    if r2 >= r1
        E=linspace(0,pi,240);
        xt=a*(cos(E)-e);
        yt=b*sin(E);
    else
        E=linspace(pi,2*pi,240);
        xt=-a*(cos(E)-e);
        yt=b*sin(E);
    end

    figure;
    plot(r1*cos(theta),r1*sin(theta),'b','LineWidth',1.2,'DisplayName','Initial Orbit');
    hold on;
    plot(r2*cos(theta),r2*sin(theta),'r','LineWidth',1.2,'DisplayName','Final Orbit');
    plot(xt,yt,'g--','LineWidth',2,'DisplayName','Transfer Orbit');
    scatter(0,0,100,'filled','MarkerFaceColor',[0.4 0.7 1], ...
            'MarkerEdgeColor','k','DisplayName',name);
    scatter(r1,0,50,'b','filled','DisplayName','Departure');
    scatter(-r2,0,50,'r','filled','DisplayName','Arrival');
    xlabel('x Position (km)');
    ylabel('y Position (km)');
    title(sprintf('%s-Centered Hohmann Transfer',name));
    legend('Location','best');
    axis equal;
    grid on;
    hold off;
end
