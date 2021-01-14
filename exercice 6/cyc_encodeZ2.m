function [nonSys_mes, sys_mes] = cyc_encodeZ2(n, gen, m)
% CYC_ENCODEZ2 
%   
%     Input:
%       n: Length of the encoded word
%       gen: The vector of the generator polyonym
%       m: The vector of the message
%     Output:
%       nonSys_mes: Encoded message in nonSystematic
%       sys_mes:    Encoded message in Systematic
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%   1) n-k =deg(gen(x)) => n-k = length(gen) => k = n - length(gen) + 1
%   2) c = m * GenMatrix in Z2, (size(GenMatrix) = k*n)
%   3) c = conv(m,gen) in Z2

%    ----- NON-SYSTEMATIC ENCODING ----
% 
%   find the generator matrix G
%   apply multiplication mXG in Z2
    k=n-length(gen)+1;
    G = zeros(k,n);
    for row = 1: k
        G(row, row:end-k+row) = gen;
    end
    c_mul = mulZp([m,zeros(1,k-length(m))], G, 2);
%   apply convolution m*gen in Z2, where message is filled with zero padding
    c_conv = convZp([m,zeros(1,k-length(m))],gen,2);
%   check equality of the encoded messages, if ok return it, else return -1
    if isequal(c_conv, c_mul)
        nonSys_mes=c_mul;
    else 
        nonSys_mes=-1;
    end
    
    

%    ----- SYSTEMATIC ENCODING ----
    pad_m = [m,zeros(1,k-length(m))];
    sys_m = [zeros(1,n-k),pad_m];
    [ ~ , d] = mydeconv(sys_m, gen,2);
    d = [d, zeros(1, k)];
    c_dif = difZp(sys_m,d,2);
    
%     PARITY CHECK MATRIX
    G=zeros(k,n);
    for i=1:k
        x_i=zeros(1,n);
        x_i(n-k + i)=1;
        [~, b_i] = mydeconv(x_i, gen, 2);
        b_i = [b_i, zeros(1, k)];
        G(i,:) = difZp(x_i,b_i,2);
    end
    c_parity = mulZp(pad_m,G,2);
%     check equality of the encoded messages, if ok return it, else return -1
    if isequal(c_dif, c_parity)
        sys_mes=c_dif;
    else 
        sys_mes=-1;
    end

end











