function [syndrom, error] = syndrom_comp_error_detect(n,gen,r)
% syndrom_comp_error_detect
%     Computes the syndrom for received polyonym and detects error
%       if error exists return 1 or else return 0
% 
%   we know from the theory that 
%   
%   1)  If error exists then r = c + e else if not r = c
%       if the syndrom is syn = 0 then we have no error since r(x) in <g(x)>
%   2) we know r(x) = b(x)g(x)+s(x) => [r(x)/g(x)] = b(x) + [s(x)/g(x)] =>
%                 => s(x) = r_{g(x)}[r(x)]

    [~, syndrom] = mydeconv(r,gen,2);
    if syndrom == 0
        error = 0;
    else 
        error = 1;
    end
end

