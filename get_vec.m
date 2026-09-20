function vec = get_vec(quantity,unit)
    x = input(sprintf("Input %s x component (%s): \n",quantity,unit));
    y = input(sprintf("Input %s y component (%s): \n",quantity,unit));
    z = input(sprintf("Input %s z component (%s): \n",quantity,unit));
    vec=[x,y,z];
end
