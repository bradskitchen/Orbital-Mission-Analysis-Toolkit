clear; clc; close all;
global mu_sun
mu_sun=1.327*10^11;
fprintf("Program Options:\n"...
        + "1 = State Vector to Orbital Elements\n"...
        + "2 = Orbital Elements to State vector\n"...
        + "3 = Hohmann Transfer\n"...
        + "4 = Plane Change Maneuver\n"...
        + "5 = Phasing Maneuver\n"...
        + "6 = Interplanetary Hohmann transfer\n"...
        + "7 = Patched-Conic Analysis\n"...
        + "8 = Mission Summary\n");
mod = input("Input program option number (1-8): \n");
if mod == 1
        R=get_vec("position","km");
        V=get_vec("velocity","km/s");
        params = get_planet(1);
        mu = params(1);
        name = planet_name(params(5));
        [oe,E,H]=OrbitalElements(R,V,mu);
        printOE(oe,E,H);
        PlotOrbit(oe,name);
elseif mod == 2
        oe = getOE();
        params = get_planet(1);
        mu=params(1);
        name = planet_name(params(5));
        [R,V,rPeri,vPeri] = StateVector(oe(1), oe(2), oe(3), oe(4), oe(5), oe(6), mu);
        PrintRV(R,V,rPeri,vPeri);
        PlotOrbit(oe,name);
elseif mod == 3
        params=get_planet(1);
        in=get_alt(3);
        out=HohmannTransfer(in,params);
        name=planet_name(params(5));
        m0=input("Input initial spacecraft mass (kg): \n");
        Isp=input("Input specific impulse (s): \n");
        fuelMass=FuelMass(out(3),Isp,m0);
        printHohmannOrbit(out,name,m0,Isp,fuelMass);
        PlotHohmannOrbit(out,name);
elseif mod == 4
        p=get_planet(1);
        alt=get_alt(3);
        mu=p(1);
        R=p(4);
        i1=input("Enter initial inclination (deg): \n");
        i2=input("Enter final inclination (deg): \n");
        params = [mu,0,R];
        out = PlaneChange(alt,params,i1,i2);
        printPlaneChange(out,abs(i2-i1));
        PlotPlaneChange(out);
elseif mod == 5
        params = get_planet(1);
        alt = get_alt(1);

        phase = input("Enter target phase angle in degrees: \n");
        minAlt = input("Enter minimum allowable altitude in km: \n");

        out = PhasingMan(alt,minAlt,phase,params);

        fprintf("Number of revolutions: %.0f\n",out(1));
        fprintf("Phasing semi-major axis: %.3f km\n",out(2));
        fprintf("Phasing eccentricity: %.5f\n",out(3));
        fprintf("Periapsis radius: %.3f km\n",out(4));
        fprintf("Apoapsis radius: %.3f km\n",out(5));
        fprintf("Total Delta V: %.5f km/s\n",out(6));
        fprintf("Rendezvous time: %.3f hr\n",out(7));
elseif mod == 6
        params=get_planet(2);
        in = get_alt(2);
        p1=params(1,:);
        p2=params(2,:);
        name1 = planet_name(p1(5));
        name2 = planet_name(p2(5));
        out = HohmannTransfer(in, params);
        [departurePhase,arrivalPhase]=PhaseAngle(out(5),out(6));
        PlotHohmann(out(5),out(6),departurePhase,name1,name2);
        printHohmann(out,departurePhase,arrivalPhase,name1,name2);
elseif mod == 7
        params = get_planet(2);
        in = get_alt(2);
        out = PatchedConic(in,params);
        name1 = planet_name(params(1,5));
        name2 = planet_name(params(2,5));
        printPatchedConic(out,name1,name2);
        PlotPatchedConic(in,params,out,name1,name2);
elseif mod == 8
        params = get_planet(2);
        in = get_alt(2);
        out = MissionSummary(in,params);
else
        error("Invalid Option Choice, Please Select one of the options provided");
end
