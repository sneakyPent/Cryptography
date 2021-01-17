function m=crcAnsiCoder(d, gen)
%     parity in bytes
    parity = [0 0];
    for i=1:length(d) 
        de2bi(parity);
        paritiesBitFormat = sumZp( ...
                tFunc( bi2de(sumZp(de2bi(d(i),8),de2bi(parity(2),8),2)),gen), ...
                [zeros(1,8),de2bi(parity(1),8)], ...
                2);
        parity = [bi2de(paritiesBitFormat(1:8)),bi2de(paritiesBitFormat(9:16))];
    end
    m = [parity,fliplr(d)];
end
