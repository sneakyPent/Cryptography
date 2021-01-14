% In this script we answer the questions of exercice 6 
% 
% On every part we use 
%       -> code (15, 11)
%       -> generator  gen = [1 1 0 0 1]
% addpath('../exercice 4')
% addpath('../exercice 5')
%% A
% Run cyc_encodeZ2 function for message m=[0 1 1 1]
n = 15;
gen = [1 1 0 0 1];
m=[0 1 1 1];
[nonSystematic, systematic] = cyc_encodeZ2(n,gen,m)
%% B
% decode the codeword c = [1 1 0 1 1 1 0 0 0 1 1 1 0 1] 
n = 15;
gen = [1 1 0 0 1];
c=[1 1 0 1 1 1 0 0 0 1 1 1 0 1];
c_padded =  [c, zeros(1, n - length(c))];
% nonSystematic decoding (discussed with another team)
% c=m*g

[nonSysMessage,~]=mydeconv(c_padded,gen,2)

% Systematic decoding
% In systematic we do know that the codeword is in the c = [-d,m] form so
%   in order to decode the message we just have to get the k last bits of the
%   codeword.
sysMesssage = c_padded(end-( k-1):end)



%% C
n = 15;
gen = [1 1 0 0 1];
r=[0 0 0 1 0 1 0 0 0 0 1 0 0 0 1];
[syndrom, error] = syndrom_comp_error_detect(n,gen,r)























