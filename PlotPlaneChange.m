function PlotPlaneChange(out)
    dv=out(1:min(3,numel(out)));
    if isscalar(out)
        labels="Single";
    elseif numel(dv) == 2
        labels=["Single","Split"];
    else
        labels=["Single","Split","Optimum"];
    end

    figure;
    bar(categorical(labels),dv);
    ylabel('Delta V (km/s)');
    title('Plane Change Delta V Comparison');
    grid on;
end
