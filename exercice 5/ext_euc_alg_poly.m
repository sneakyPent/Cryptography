function [g, s, t] = ext_euc_alg_poly(a, b, p)

    g = a;
    s = 1;
    t = 0;
    r_0 = b;
    x_0 = 0; 
    y_0 = 1;
  
    while r_0 ~= 0
        [q,r] = mydeconv(g, r_0, p);
       
        g = r_0;
        r_0 = r;
        x = gfsub(s, convZp(q, x_0, p), p);
        s = x_0;
        x_0 = x;
        y = gfsub(t, convZp(q, y_0, p), p);
        t = y_0;
        y_0 = y;
    end
end












