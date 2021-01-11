function z = divZp(x, y, p)

    % calculates the division x/y in Z_p  
    y=invZp(y,p);
    z=mulZp(x,y,p);
end
