function out = get_planet(num_planets)
    planet_names = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"];
    dataFile=fullfile(fileparts(mfilename('fullpath')),'planet_data.csv');
    planets=readmatrix(dataFile,'NumHeaderLines',1);
    
    fprintf("Planet Choices (Use number when inputing planet choice)\n");
    for idx= 1:length(planet_names)
        fprintf("%s = %d\n", planet_names(idx), idx);
    end

    if num_planets == 1
        i = input("Enter planet number (1-8): \n");
        out = planets(i,:);
    elseif num_planets == 2
        i = input("Input departure planet number (1-8): \n");
        j = input("Input arrival planet number (1-8): \n");
        if i == j
            error("planets cannot be the same, please try again");
        end
        out = [planets(i,:);planets(j,:)];
    end
end
