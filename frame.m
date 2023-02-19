function FrameNum = frame(Ms,varargin)
FPS = 4.68; %22.39
if ~isempty(varargin)
    FPS = varargin{1};
end

FrameNum = round(Ms/(1000/FPS));

