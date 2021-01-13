function [c, d] = mydeconv(a, b, p)
    
% In order to devide the polyonyms we get a, b like we next example
%   a = x^4+5x^3+2x^2+6x+4  -> a = [4 6 2 5 1]
%   b = 3x^2+2x+1           -> b = [1 2 3] 
%
%   1) search a "z" in Zp, so that z = a(end)*b(end)^(-1)
%   2) multiply z,b in Zp (mul = mulZp(z,b,p))
%   3) subtract a-mul in Zp
%   4) use the result in the same process until the biggest exponent of the
%       remainder is lower than the biggest exponent of devisor
%   In order to achieve the correct factors we need to start from the
%       factor of the biggest exponent

%     addpath('../exercice 3')

    devidend = a;
    devisor = b;
    quotient = [];
    while (length(devidend)>= length(devisor))
           z=mod(devidend(end)*invZp(devisor(end),p),p);
           mul = mulZp(z,devisor,p);
           quotient = [quotient, z];
           devidend(end - length(mul)+1:end) = difZp(devidend(end - length(mul)+1:end), mul, p);
           devidend = devidend(1:end-1);
    end
    remainder = devidend;
    c=flip(quotient);
    d=remainder;
end








