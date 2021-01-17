function b = tFunc(a, gen)
%TFUNC
%   a in bytes
%   1) transform a to binary from bytes
%   2) shift the a signal by 16 (mul by x^16)
%   3) b = r_{g(x)}[x^16 * a]

a_bit = de2bi(a);
a_x16 = [zeros(1,16),a_bit];
[~,b] = mydeconv(a_x16,gen,2);
end

