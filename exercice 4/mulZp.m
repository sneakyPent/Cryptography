function z = mulZp(x, y, p)

    % calculates the X*Y in Z_p
    z = mod(x * y, p);
end
