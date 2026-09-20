function JD=JulianDate(y,M,d,h,m,s)
    %%julian data
    %%jd(Year, Month, Day, Hour, Minute, Second)
    JD = (367*y)-(floor((7*(y+floor((M+9)/12)))/(4)))+(floor((275*M)/9))+d+1721013.5+(h/24)+((m+(s/60))/1440);
end