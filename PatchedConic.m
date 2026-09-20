function out = PatchedConic(in,pd)
    global mu_sun

    p1 = pd(1,:);
    p2 = pd(2,:);

    mu1 = p1(1);
    mu2 = p2(1);

    a1 = p1(2);
    a2 = p2(2);

    R1 = p1(4);
    R2 = p2(4);

    alt1 = in(1);
    alt2 = in(2);

    rp1 = R1 + alt1;
    rp2 = R2 + alt2;

    %hohmann transfer around the Sun
    at = (a1+a2)/2;

    vp1 = sqrt(mu_sun/a1);
    vp2 = sqrt(mu_sun/a2);

    vt1 = sqrt(mu_sun*(2/a1-1/at));
    vt2 = sqrt(mu_sun*(2/a2-1/at));

    vInf1 = abs(vt1-vp1);
    vInf2 = abs(vp2-vt2);

    % Parking orbit velocities
    vc1 = sqrt(mu1/rp1);
    vc2 = sqrt(mu2/rp2);

    vHyp1 = sqrt(vInf1^2+2*mu1/rp1);
    vHyp2 = sqrt(vInf2^2+2*mu2/rp2);

    % Delta V
    dv1 = vHyp1-vc1;
    dv2 = vHyp2-vc2;
    dvTotal = dv2+dv1;

    % Hyperbola eccentricities
    eHyp1 = 1+(rp1*vInf1^2/mu1);
    eHyp2 = 1+(rp2*vInf2^2/mu2);

    % Turning angles
    d1 = 2*asind(1/eHyp1);
    d2 = 2*asind(1/eHyp2);

    % Transfer time in days
    time = pi*sqrt(at^3/mu_sun)/(24*3600);

    out = [dv1,dv2,dvTotal,vInf1,vInf2,...
           d1,d2,eHyp1,eHyp2,time];
end