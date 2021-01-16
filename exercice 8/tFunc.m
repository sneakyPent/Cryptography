function b = tFunc(a, gen)
%TFUNC
%   a in bytes
%   1) transform a to binary from bytes

a_bit = de2bi(a);
a_x16 = [zeros(1,16),a_bit];
[~,b] = mydeconv(a_x16,gen,2);
end

