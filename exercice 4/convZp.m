function z = convZp(x, y, p)

    % Fixme: calculates the concolution of x,y in Z_p
    % 
    % calculate the convolution of x,y
    n=length(x);
    X=[x,zeros(1,n)];
    Y=[y,zeros(1,n)];
    for i=1:2*n-1
        z(i)=0;
        for j=1:n
            if(i-j+1>0)
                z(i)=z(i)+X(j)*Y(i-j+1);
            else
            end
        end
    end
    z = mod(z,p);
   
end