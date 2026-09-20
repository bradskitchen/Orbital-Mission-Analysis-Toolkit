function mp = FuelMass(dv,Isp,m0)
    if dv < 0 || Isp <= 0 || m0 <= 0
        error("Delta V must be nonnegative and Isp and mass must be positive");
    end

    g0 = 0.00980665;
    mf = m0*exp(-dv/(Isp*g0));
    mp = m0-mf;
end
