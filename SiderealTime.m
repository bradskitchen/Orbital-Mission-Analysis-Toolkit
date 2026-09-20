function theta = SiderealTime(JD,longitude)
    if nargin < 2
        longitude=0;
    end

    T=(JD-2451545.0)/36525;
    theta=280.46061837+360.98564736629*(JD-2451545.0)+0.000387933*T^2-T^3/38710000+longitude;
    theta=mod(theta,360);
end
