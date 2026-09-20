function PrintRV(R,V,rPeri,vPeri)
    fprintf("\nPERIFOCAL FRAME\n");
    fprintf("Position (km):\n%.4f\n%.4f\n%.4f\n",rPeri(1),rPeri(2),rPeri(3));
    fprintf("Velocity (km/s):\n%.4f\n%.4f\n%.4f\n",vPeri(1),vPeri(2),vPeri(3));
    fprintf("\nECI FRAME\n");
    fprintf("Position (km):\n%.4f\n%.4f\n%.4f\n",R(1),R(2),R(3));
    fprintf("Velocity (km/s):\n%.4f\n%.4f\n%.4f\n",V(1),V(2),V(3));
end
