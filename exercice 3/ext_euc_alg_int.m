function [g, s, t] = ext_euc_alg_int(a, b)

%   g = r*r_0 + r   

    g = a;
    s = 1;
    t = 0;
    r_0 = b;
    x_0 = 0; 
    y_0 = 1;
    
    if b==0
        s=1;
        t=0;
        g=a;
        return;
    end
        
    while r_0 ~= 0
        r = mod(g,r_0);
        q = fix(g / r_0);
       
        g = r_0;
        r_0 = r;
        x = s - q*x_0;
        s = x_0;
        x_0 = x;
        y = t - q*y_0;
        t = y_0;
        y_0 = y;
    end
end
