% 
%   1) Using the systematic encoder (15,11) of exercice 6, transmit 10^4
%       Independent and identically distributed random messages
%   2) Check if error is detected by syndrom_comp_error_detect func (ex 6)
% 
% 
% 
%   *In every transmission create message and error independently,transmit the message
%       and add the transmitted with the error to crete the errorTransmitted message
% 

n=15;
k=11;
F=2;
maxErrorLen = 10;
g=[1 1 0 0 1];
numOfMessages = 10^5;
theoreticalProbability = ones(1,maxErrorLen-1);
experimentalProbability = ones(1,maxErrorLen-1);
for i=2:maxErrorLen
    theoreticalProbability(i) = theoretical_detection(n,k,i,F);
end

% non1=zeros(1,10); non2=zeros(1,10);
% no_error=zeros(1,10);

for len=2:maxErrorLen
    numOfDetectedErrors=0;
   for msg=1:numOfMessages
       
%        create the Independent and identically distributed random message
       m=randi([0 1],1,4,'double');
%        create the error vector of zeros
       e = zeros(1,n); 
%        find a random index to start the radnom error vector of len(e(x)) = len
       idx=randi([1 n-len+1],'double');
%        create a random error vector with length = len
       rer=randi([0 1],1,len,'double');
%        import the random error vector, in the zeros error vector, in the
%           previous index idx
       e(idx:idx+len-1)=rer;
       while e == zeros(1,n)
           rer=randi([0 1],1,len,'double');
%           import the random error vector, in the zeros error vector, in the
%               previous index idx
           e(idx:idx+len-1)=rer;
       end
       [~,systematicMessage]=cyc_encodeZ2(n,g,m);
       errorTransmitted=sumZp(systematicMessage,e,2);
       [~,error]=syndrom_comp_error_detect(n,g,errorTransmitted);
       numOfDetectedErrors=numOfDetectedErrors+error;
       
   end
   numOfDetectedErrors
   experimentalProbability(len)=numOfDetectedErrors/numOfMessages
end
experimentalProbability
figure()
plot([1:maxErrorLen],experimentalProbability, [1:maxErrorLen],theoreticalProbability);
axis([1 10 0.7 1.1])