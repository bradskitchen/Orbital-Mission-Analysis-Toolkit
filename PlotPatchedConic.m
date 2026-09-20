function PlotPatchedConic(in,params,out,name1,name2)
    rp1=params(1,4)+in(1);
    rp2=params(2,4)+in(2);
    [x1,y1]=Hyperbola(rp1,out(8));
    [x2,y2]=Hyperbola(rp2,out(9));
    theta=linspace(0,2*pi,360);

    figure;
    tiledlayout(1,2);

    nexttile;
    plot(x1,y1,'b','LineWidth',1.5,'DisplayName','Departure Hyperbola');
    hold on;
    plot(params(1,4)*cos(theta),params(1,4)*sin(theta),'k', ...
         'LineWidth',1.2,'DisplayName',name1);
    xlabel('x Position (km)');
    ylabel('y Position (km)');
    title(sprintf('%s Departure',name1));
    legend('Location','best');
    axis equal;
    grid on;

    nexttile;
    plot(x2,y2,'r','LineWidth',1.5,'DisplayName','Arrival Hyperbola');
    hold on;
    plot(params(2,4)*cos(theta),params(2,4)*sin(theta),'k', ...
         'LineWidth',1.2,'DisplayName',name2);
    xlabel('x Position (km)');
    ylabel('y Position (km)');
    title(sprintf('%s Arrival',name2));
    legend('Location','best');
    axis equal;
    grid on;
end
