function gu = equidistribution(u, bins)
%%=========================================================================
% Copyright © 2018, SoC Design Lab., Dong-A University. All Right Reserved.
%==========================================================================
% • Date       : 2018/05/14
% • Author     : Dat Ngo
% • Affiliation: SoC Design Lab. - Dong-A University
% • Design     : Equidistribution (nearby-bins not guarantee)
%==========================================================================
%
%EQUIDISTRIBUTION Equidistribution.
%   GU = EQUIDISTRIBUTION(U, BINS) performs equidistribution on U with BINS 
%   histogram bins.

gu = u;
n = histcounts(gu, bins);
[n1, loc1] = sort(n, 'ascend');
[n2, loc2] = sort(n, 'descend');
diff = (n1+n2)/2 - n1;

for i = 1:length(diff)
    if (diff(i)>0)
        loc3 = find(gu == loc2(i));
        for j = 1:diff(i)
            gu(loc3(j)) = loc1(i);
        end
    elseif (diff(i)<0)
        loc3 = find(gu == loc1(i));
        for j = 1:diff(i)
            gu(loc3(j)) = loc2(i);
        end
    else
        % do nothing
    end
end

end
