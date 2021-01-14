function detectionProbability= theoretical_detection(n,k,len,F)
%THEORETICAL_DETECTION 

% %%%%%%%%%%%%% THEORETICAL %%%%%%%%%%%%%
% 
%   for len(e(x)) <= n-k                --> nonDetected = 0
%   for len(e(x)) = n-k+1           F=2 --> nonDetected = 1/ [(|F|-1)*|F|^{n-k-1}]
%   for len(e(x)) > n-k+1           F=2 --> nonDetected <= 1/ |F|^{n-k}
%
    if len <= n-k
        nonDetected = 0;
    elseif len == n-k+1
        nonDetected = 1 / ((F-1)*(F^(n-k-1)));
    elseif len > n-k+1
        nonDetected = 1 / F^(n-k);
    end
        
    detectionProbability = 1-nonDetected;
end

