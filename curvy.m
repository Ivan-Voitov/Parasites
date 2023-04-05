function X = curvy(X,Prc)

Diff = abs(diff(X));
for L = 1:length(Prc)
    DiffLim(L) = prctile(Diff,Prc(L));
end
if length(Prc) == 1
    X(Diff>DiffLim(1)) = nan;
else
    X(Diff<DiffLim(1)) = nan;
    X(Diff>DiffLim(2)) = nan;
end