function [x,y,z,c] = funkcja_wykresy(typ_wykresu,zakres,parametry_rownania)
    a = parametry_rownania(1);
    b = parametry_rownania(2);
    c = parametry_rownania(3);

    if typ_wykresu == 1
        [x,y] = meshgrid(zakres(1):zakres(2):zakres(3),zakres(1):zakres(2):zakres(3));
        z = cos(a*x).*cos(b*y).*exp(-sqrt(x.^2+y.^4)/7)*c;
        surf(x,y,z);
    elseif typ_wykresu == 2
        [x,y] = meshgrid(zakres(1):zakres(2):zakres(3),zakres(1):zakres(2):zakres(3));
        z = cos(1*x).*cos(y).*exp(-sqrt(x.^2+y.^4)/7);
        c=gradient(z);
        waterfall(x,y,z,c);
        colorbar
        legend
    end

end