function [oe,E,H] = OrbitalElements(R,V,mu)
    R=R(:);
    V=V(:);
    r=norm(R);
    v=norm(V);

    if r == 0 || mu <= 0
        error("Position magnitude and mu must be positive");
    end

    H=cross(R,V);
    h=norm(H);
    if h == 0
        error("Position and velocity cannot be parallel");
    end

    E=v^2/2-mu/r;
    if abs(E) < 1e-12
        a=Inf;
    else
        a=-mu/(2*E);
    end

    eVec=((v^2-mu/r)*R-dot(R,V)*V)/mu;
    eMag=norm(eVec);
    i=acos(max(-1,min(1,H(3)/h)));

    N=cross([0;0;1],H);
    n=norm(N);
    tol=1e-10;

    if n > tol*h
        RAAN=mod(atan2(N(2),N(1)),2*pi);
    else
        RAAN=0;
    end

    if eMag > tol && n > tol*h
        cosOmega=dot(N,eVec)/(n*eMag);
        sinOmega=dot(cross(N,eVec),H)/(n*eMag*h);
        omega=mod(atan2(sinOmega,cosOmega),2*pi);
    elseif eMag > tol
        omega=mod(atan2(eVec(2),eVec(1)),2*pi);
    else
        omega=0;
    end

    if eMag > tol
        cosNu=dot(eVec,R)/(eMag*r);
        sinNu=dot(cross(eVec,R),H)/(eMag*r*h);
        nu=mod(atan2(sinNu,cosNu),2*pi);
    elseif n > tol*h
        cosNu=dot(N,R)/(n*r);
        sinNu=dot(cross(N,R),H)/(n*r*h);
        nu=mod(atan2(sinNu,cosNu),2*pi);
    else
        nu=mod(atan2(R(2),R(1)),2*pi);
    end

    oe=[a,eMag,rad2deg(i),rad2deg(RAAN),rad2deg(omega),rad2deg(nu)];
end
