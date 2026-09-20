function out = PlaneChange(alt,params,i1,i2)
    %a,e
    mu =params(1);
    e=params(2);
    re=params(3);
    di=abs(i2-i1);
    if isscalar(alt)
        r=alt+re;
        if e==0
            %circ delta i
            v=sqrt(mu/r);
            dv=2*v*sind(di/2);
            out=dv;
        else
            %must assume alt is at periapsis
            %elleptical delta i
            %single
            a=r/(1-e);
            rp=r;
            ra=a*(1+e);
            vp = sqrt(mu*(2/rp-1/a));
            va = sqrt(mu*(2/ra-1/a));
            dv1=2*va*sind(di/2);
            %split
            dv2=(2*va*sind(di/4))+(2*vp*sind(di/4));
            %opt
            %tbd
            out = [dv1,dv2];
        end
    else
        %transfer delta i
        %single
        r1 = re + alt(1);
        r2 = re + alt(2);

        aT = (r1+r2)/2;

        v1 = sqrt(mu/r1);
        v2 = sqrt(mu/r2);

        vt1 = sqrt(mu*(2/r1-1/aT));
        vt2 = sqrt(mu*(2/r2-1/aT));
        dvH1 = abs(vt1-v1);
        dvH2 = abs(v2-vt2);
        dvHT = dvH1+dvH2;
        
        temp1 = sqrt(v1^2 + vt1^2 - 2*v1*vt1*cosd(di)) + abs(v2-vt2);
        temp2 = abs(vt1-v1) + sqrt(vt2^2 + v2^2 - 2*vt2*v2*cosd(di));
        [dv1,index] = min([temp1,temp2]);
        if index == 1
            location=1;
        else
            location=2;
        end
        %split
        temp1 = sqrt(v1^2 + vt1^2 - 2*v1*vt1*cosd(di/2));
        temp2 = sqrt(v2^2 + vt2^2 - 2*v2*vt2*cosd(di/2));
        dv2=temp1+temp2;
        %opt
        %tbd
        dum = optdi(di,v1,v2,vt1,vt2);
        di1=dum(1); di2=dum(2);
        dvOpt1 = sqrt(v1^2+vt1^2 -2*v1*vt1*cosd(di1));
        dvOpt2 = sqrt(vt2^2+v2^2 -2*vt2*v2*cosd(di2));
        dv3 = dvOpt1+dvOpt2;
        out=[dv1,dv2,dv3,di1,di2,dvHT,location];
    end
end
