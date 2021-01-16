clc ;clear all

len = 17;
messageBytes = 100;
n = (messageBytes+2)*8;
gen = [1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1];
numOfDetectedErrors = 0;

for msg=1:1000
    d=randi([0 255],1,messageBytes,'double');
    c = crcAnsiCoder(d,gen);
    bn_c = reshape(de2bi(c)',1,[]);
    e = zeros(1, n); 
    %        find a random index to start the radnom error vector of len(e(x)) = len
    idx=randi([1 n-len+1],'double');
    %        create a random error vector with length = len-2
    rer = [1,randi([0 1],1,len-2,'double'),1];
    %        import the random error vector, in the zeros error vector, in the
    %           previous index idx
    e(idx:idx+len-1)=rer;
    % create the mixed message-error transmission
    errorTransmitted=sumZp(bn_c,e,2);
    % pass message from syndrom detection
    [~,error]=syndrom_comp_error_detect(n,gen,errorTransmitted);
    numOfDetectedErrors=numOfDetectedErrors+error;
end
numOfDetectedErrors

% we know that the only undetected error could be when the error polyonym
% is the same as the generator polyonym so we test it below for a loop of
% 20
numOfDetectedErrors = 0;
for msg=1:1000
    d=randi([0 255],1,messageBytes,'double');
    c = crcAnsiCoder(d,gen);
    bn_c = reshape(de2bi(c)',1,[]);
    e = zeros(1, n); idx=randi([1 n-len+1],'double');
    e(idx:idx+len-1)=gen;
    errorTransmitted=sumZp(bn_c,e,2);
    [~,error]=syndrom_comp_error_detect(n,gen,errorTransmitted);
    numOfDetectedErrors=numOfDetectedErrors+error;
end
numOfDetectedErrors





