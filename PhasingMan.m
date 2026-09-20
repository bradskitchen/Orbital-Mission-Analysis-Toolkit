function out = PhasingMan(alt, minAlt, phase, params)
    mu = params(1);
    R = params(4);
    r = R + alt;

    T = 2*pi*sqrt(r^3/mu);

    for N = 1:100
        Tp = T*(1-phase/(360*N));
        a = (mu*(Tp/(2*pi))^2)^(1/3);

        r2 = 2*a-r;
        rp = min(r,r2);
        ra = max(r,r2);

        if rp >= R+minAlt
            break
        end
    end

    vc = sqrt(mu/r);
    vp = sqrt(mu*((2/r)-(1/a)));

    e = (ra-rp)/(ra+rp);
    dv = 2*abs(vp-vc);
    t = N*Tp/3600;

    out = [N,a,e,rp,ra,dv,t];
end