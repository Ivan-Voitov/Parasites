function patches(Centroids,Intervals,Xs,varargin)
% centroids intervals xs
%% arguments
FaceAlpha = 0.2;
Colour = 'k';
Extrapolate = 1;

for I=1:2:numel(varargin)
    eval([varargin{I} '= varargin{I+1};']);
end
%% draw
for I = 1:length(Intervals)
    if ~isempty(Centroids)
        % define top row and bottom row
        YTop(I) = Centroids(I) + Intervals(I);
        YBottom(I) = Centroids(I) - Intervals(I);
    else
        YTop(I) = Intervals(I,2);
        YBottom(I) = Intervals(I,1);
        
    end
end

for X = Xs
    I = ((X-min(Xs)) ./ median(diff(Xs)))+1;
    
    XLeftPatch = [X X X-(median(diff(Xs))/2) X-(median(diff(Xs))/2)];
    XRightPatch = [X+(median(diff(Xs))/2) X+(median(diff(Xs))/2) X X];
    
    if I > 1
        YLeftPatch =[YBottom(I) YTop(I) ...
            mean([YTop(I-1) YTop(I)]) mean([YBottom(I-1) YBottom(I)])];
    else
        YLeftPatch =[YBottom(I) YTop(I) ...
            mean([YTop(I) YTop(I)]) mean([YBottom(I) YBottom(I)])];
    end
    if I < length(Xs)
        YRightPatch =[mean([YBottom(I+1) YBottom(I)]) mean([YTop(I+1) YTop(I)]) ...
            YTop(I) YBottom(I)];
    else
        YRightPatch =[mean([YBottom(I) YBottom(I)]) mean([YTop(I) YTop(I)]) ...
            YTop(I) YBottom(I)];
    end
    %        YCentre = Centroids(((XPatch-960) ./ 320)+1);
    %        YEdge = Intervals(((X-min(Xs)) ./ median(diff(Xs)))+1);
    %        if X == 960
    %            Ys = [YCentre-YEdge YCentre+YEdge YCentre+YEdge YCentre-YEdge];
    %        else
    %            Ys = [YCentre-YEdge YCentre+YEdge YCentre+YEdge YCentre-YEdge];
    %        end
    
    patch(XLeftPatch,YLeftPatch,Colour,'EdgeColor','none','FaceAlpha',FaceAlpha)
    patch(XRightPatch,YRightPatch,Colour,'EdgeColor','none','FaceAlpha',FaceAlpha)
end
