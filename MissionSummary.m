function out = MissionSummary(in,params)
    global mu_sun
    out = HohmannTransfer(in,params);
    p1 = params(1,:);
    p2 = params(2,:);
    name1 = planet_name(p1(5));
    name2 = planet_name(p2(5));
    [departurePhase,arrivalPhase] = PhaseAngle(out(5),out(6));
    dvp = out(3)-out(1)-out(2);
    et = abs(out(6)-out(5))/(out(6)+out(5));
    fileID = fopen('MissionSummary.txt','w');

    for fid = [1,fileID]
        fprintf(fid,'\nORBITAL MISSION SUMMARY\n');
        fprintf(fid,'Mission: %s to %s\n',char(name1),char(name2));
        fprintf(fid,'Departure parking altitude: %.2f km\n',in(1));
        fprintf(fid,'Arrival parking altitude: %.2f km\n\n',in(2));
        fprintf(fid,'Escape Delta V: %.4f km/s\n',out(1));
        fprintf(fid,'Arrival Delta V: %.4f km/s\n',out(2));
        fprintf(fid,'Plane Change Delta V: %.4f km/s\n',dvp);
        fprintf(fid,'Total Delta V: %.4f km/s\n\n',out(3));
        fprintf(fid,'Transfer Time: %.3f days\n',out(4));
        fprintf(fid,'Departure Phase Angle: %.3f deg\n',departurePhase);
        fprintf(fid,'Arrival Phase Angle: %.3f deg\n\n',arrivalPhase);
        fprintf(fid,'Departure V Infinity: %.4f km/s\n',out(10));
        fprintf(fid,'Arrival V Infinity: %.4f km/s\n',out(11));
        fprintf(fid,'Transfer Semi-Major Axis: %.3f km\n',out(7));
        fprintf(fid,'Transfer Eccentricity: %.5f\n\n',et);
        fprintf(fid,'Major Assumptions:\n');
        fprintf(fid,'- Circular planetary orbits\n');
        fprintf(fid,'- Circular parking orbits\n');
        fprintf(fid,'- Instantaneous impulsive burns\n');
        fprintf(fid,'- Two-body motion\n');
        fprintf(fid,'- No atmospheric drag or perturbations\n');
        fprintf(fid,'- Plane change occurs at departure\n');
    end
    fclose(fileID);
    fprintf('\nMission summary saved to MissionSummary.txt\n');
end
