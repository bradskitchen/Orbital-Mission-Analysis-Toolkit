function out = get_alt(mode)
    if mode == 1
        out = input("Input altitude (km): \n");
    elseif mode == 2
        o1 = input("Input departure parking-orbit altitude (km): \n");
        o2 = input("Input arrival parking-orbit altitude (km): \n");
        out = [o1,o2];
    elseif mode == 3
        o1 = input("Input initial altitude (km): \n");
        o2 = input("Input final altitude (km): \n");
        out = [o1,o2];
    end
end
