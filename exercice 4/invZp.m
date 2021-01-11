function z = invZp(x, p)

    
%     calculates the the inversion of x in Z_p
% 
%     1) Use the euklidean algorithm to find the inverse of x, x^(-1) (mod p),
%     2) calculate the z = x mod p.

    addpath('../exercice 3')
    [g,s,t] = ext_eu_alg_int(x,p)
    z = mod(s, p);
end
