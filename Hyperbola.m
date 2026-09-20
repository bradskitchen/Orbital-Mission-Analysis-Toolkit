function [x,y] = Hyperbola(rp,e)
    nuLimit=0.9*acos(-1/e);
    nu=linspace(-nuLimit,nuLimit,400);
    p=rp*(1+e);
    r=p./(1+e*cos(nu));
    x=r.*cos(nu);
    y=r.*sin(nu);
end
