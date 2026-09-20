function [R,V,r_peri,v_peri] = StateVector(a,e,i,RAAN,omega,nu,mu)
    p=a*(1-e^2);
    nu=deg2rad(nu);
    r=p/(1+e*cos(nu));

    RAAN=deg2rad(RAAN); omega=deg2rad(omega); i=deg2rad(i);
    cr=cos(RAAN); co=cos(omega); ci=cos(i);
    sr=sin(RAAN); so=sin(omega); si=sin(i);
    t = [cr*co-sr*ci*so, -cr*so-sr*ci*co, sr*si;
         sr*co+cr*ci*so, -sr*so + cr*ci*co, -cr*si;
         si*so, si*co, ci];

    r_peri = [r*cos(nu); r*sin(nu); 0];
    R=t*r_peri;
    v_peri = [-sqrt(mu/p)*sin(nu); sqrt(mu/p)*(e+cos(nu)); 0];
    V=t*v_peri;
end
