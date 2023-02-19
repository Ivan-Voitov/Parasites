[White, Grey, Black, Red, Blue, Orange, Green, Purple, Metal, Silver, Brown] = deal(zeros(1,2,3));

White(1,1,:) = [1 1 1];
Grey(1,1,:) = [0.5 0.5 0.5];
Black(1,1,:) = [0 0 0];

% stimuli
Red(1,1:2,:) = repmat([0.8 0.25 0.2], [2 1]);
Blue(1,1:2,:) = repmat([0.1 0.3 0.55], [2 1]);

% contexsts
Orange(1,1:2,:) = repmat([0.8 0.4 0], [2 1]);
Green(1,1:2,:) = repmat([0.4 0.8 0.4], [2 1]);
Purple(1,1:2,:) = repmat([0.6 0 0.55], [2 1]);

% cue/probe/target
Metal(1,1:2,:) = repmat([0.2 0.3 0.4], [2 1]);
Silver(1,1:2,:) = repmat([0.7 0.7 0.6], [2 1]);
Brown(1,1:2,:) = repmat([0.27 0.24 0.22], [2 1]);

% figure;
% image([White Grey White Red Blue White Orange Green Purple White Metal Silver Brown White]);

Red = squeeze(Red(1,1,:))';
Blue = squeeze(Blue(1,1,:))';
Orange = squeeze(Orange(1,1,:))';
Green = squeeze(Green(1,1,:))';
Purple = squeeze(Purple(1,1,:))';
Metal = squeeze(Metal(1,1,:))';
Silver = squeeze(Silver(1,1,:))';
Brown = squeeze(Brown(1,1,:))';
White = squeeze(White(1,1,:))';
Grey = squeeze(Grey(1,1,:))';
Black = squeeze(Black(1,1,:))';

% Ax = gca;
% Ax.XTick = [];
% Ax.YTick = [];