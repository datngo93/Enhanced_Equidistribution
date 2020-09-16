function gu = enhanced_equidistribution(u, bins)
%%=========================================================================
% Copyright ?2018, SoC Design Lab., Dong-A University. All Right Reserved.
%==========================================================================
% ?Date       : 2018/05/21
% ?Author     : Dat Ngo
% ?Affiliation: SoC Design Lab. - Dong-A University
% ?Design     : Enhanced equidistribution
%==========================================================================
%
%ENHANCED_EQUIDISTRIBUTION Enhanced equidistribution.
%   U = ENHANCED_EQUIDISTRIBUTION(U, BINS) performs enhanced equidistribution
%    on U with BINS histogram bins.

h = size(u,1);
w = size(u,2);

n = histcounts(u, bins);
thres = round(h*w/bins);

for h = 1:bins
    if (n(h) < thres)
        loc = find(n > thres);
        diff = n(loc)-thres;
        for k = 1:length(diff)
            loc2 = find(u == loc(k));
            for j = 1:diff(k)
                u(loc2(j)) = h;
                n(h) = n(h)+1;
                n(loc(k)) = n(loc(k))-1;
                if (n(h) >= thres)
                    break;
                elseif (n(loc(k)) <= thres)
                    break;
                end
            end
            if (n(h) >= thres)
                break;
            end
        end
    elseif (n(h) > thres)
        loc = find(n < thres);
        diff = thres-n(loc);
        for k = 1:length(diff)
            loc2 = find(u == h);
            for j = 1:diff(k)
                u(loc2(j)) = loc(k);
                n(h) = n(h)-1;
                n(loc(k)) = n(loc(k))+1;
                if (n(h) <= thres)
                    break;
                elseif (n(loc(k)) >= thres)
                    break;
                end
            end
            if (n(h) <= thres)
                break;
            end
        end
    else
        % do nothing
    end
end

hloc = find(n~=thres);
inc = 0;
dec = 0;
for index = 1:length(hloc)
    h = hloc(index);
    if (n(h) < thres)
        diff = thres-n(h);
        for k = 1:diff
            loc = find(u == (mod(dec,bins)+1));
            u(loc(1)) = h;
            n(h) = n(h)+1;
            n(mod(dec,bins)+1) = n(mod(dec,bins)+1)-1;
            dec = mod(dec,bins)+1;
        end
    elseif (n(h) > thres)
        loc = find(u == h);
        diff = n(h)-thres;
        for k = 1:diff
            u(loc(k)) = mod(inc,bins)+1;
            n(h) = n(h)-1;
            n(mod(inc,bins)+1) = n(mod(inc,bins)+1)+1;
            inc = mod(inc,bins)+1;
        end
    else
        % do nothing
    end
end

gu = u;

end
