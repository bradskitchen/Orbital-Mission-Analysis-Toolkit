function out = optdi(diT,vc1,vc2,vt1,vt2)
    if diT == 0
        out=[0,0];
        return
    end
    fun = @(x) (sqrt((vc1^2)+(vt1^2)-(2*vt1*vc1*cos(x)))) + (sqrt((vc2^2)+(vt2^2)-(2*vt2*vc2*cos(deg2rad(diT)-x))));
    di = fminbnd(fun,0,deg2rad(diT));
    di1 = rad2deg(di);
    di2 = diT-di1;
    out=[di1,di2];
end
