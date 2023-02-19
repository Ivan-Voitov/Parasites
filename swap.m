function Swapped = swap(ToSwap,Index)

if isempty(Index)
    Index = 1;
end
try
    Swapped = ToSwap(Index);
catch
    try
        Swapped = ToSwap(rem(Index,length(ToSwap)));
    catch
        Swapped = ToSwap(end);
    end
end
if iscell(ToSwap)
    Swapped = Swapped{:};
end