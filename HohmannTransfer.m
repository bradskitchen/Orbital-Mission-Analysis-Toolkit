function out = HohmannTransfer(in, pd)
    global mu_sun
    if min(size(pd)) == 2%%test may be wrong
        p1 = pd(1,:);
        p2 = pd(2,:);
        mu_p1 = p1(1);
        mu_p2 = p2(1);
        ap1 = p1(2);
        ap2 = p2(2);
        alt1 = in(1);
        alt2 = in(2);
        ip1 = p1(3);
        ip2 = p2(3);
        R1 = p1(4);
        R2 = p2(4);
        ip = abs(ip2-ip1);

        r1=R1+alt1;
        v_c1 = sqrt(mu_p1/(r1));
        r2=R2+alt2;
        v_c2 = sqrt(mu_p2/r2);
        at = (ap1+ap2)/2;
        
        % Transfer
        vp1=sqrt(mu_sun/ap1);
        vp2=sqrt(mu_sun/ap2);
        vt1 = sqrt(mu_sun*((2/ap1)-(1/at)));
        v_inf1=abs(vt1-vp1);
        vt2 = sqrt(mu_sun*((2/ap2)-(1/at)));
        v_inf2=abs(vp2-vt2);
        
        % Burnout velocity
        v_bo = sqrt(v_inf1^2+((2*mu_p1)/r1));
        
        % Delta V Calculations
        dv1=v_bo-v_c1;
        v_hyp2 = sqrt(v_inf2^2+((2*mu_p2)/r2));
        dv2 = v_hyp2-v_c2;
        dvi = 2*v_c1*sin(deg2rad(ip)/2); % delta v due to inclination difference b/t earth and mars... done before transfer
        dvT = dv1+dv2+dvi; % total delta v expended
        
        t = pi*sqrt((at^3)/mu_sun);
        
        transfer_time = t/(3600*24);
        out=[dv1, dv2, dvT, transfer_time, ap1, ap2, at, vp1, vp2, v_inf1, v_inf2, vt1, vt2];
    else
        mu=pd(1);
        R=pd(4);
        alt1 = in(1);
        alt2 = in(2);
        r1=R+alt1;
        v_c1 = sqrt(mu/(r1));
        r2=R+alt2;
        v_c2 = sqrt(mu/r2);
        at = (r1+r2)/2;

        vt1=sqrt(mu*((2/r1)-(1/at)));
        vt2=sqrt(mu*((2/r2)-(1/at)));
        dv1=abs(vt1-v_c1);
        dv2=abs(v_c2-vt2);
        dvT=dv1+dv2;
        t = pi*sqrt((at^3)/mu);
        transfer_time=t/(3600);
        out=[dv1,dv2,dvT,transfer_time,r1,r2,at,v_c1,v_c2,vt1,vt2];
    end
end
