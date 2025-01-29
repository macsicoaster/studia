function z=flc_error_ffunc(x)

    global kp ti
    kp = x(1);
    ti = x(2);
    out = sim('nazwa_modelu');

    z = 0.5*(sum(e.^2))