function v = EscapeVelocity(r,mu)
    if r <= 0 || mu <= 0
        error("Radius and mu must be positive");
    end
    v=sqrt(2*mu/r);
end
