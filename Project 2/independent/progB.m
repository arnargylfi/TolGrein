function likindi = progB(x, y, dx, dy, k, m, L, T)

% þarf að commenta út og inn rétta fallið

%hjarta
f_x = @(t) 16*sin(t).^3;
f_y = @(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
t = linspace(0, 2*pi,  100);
fyrirmynd = [f_x(t); f_y(t)]';

% % % lemniscate (infinity symbol)
% a = 2;
% f_x = @(t) (a*cos(t))./(sin(t).^2 + 1);
% f_y = @(t) (a*sin(t).*cos(t))./(sin(t).^2 + 1) - 2;
% t = linspace(2*pi, 0, 100)+pi/2;
% fyrirmynd = [f_x(t); f_y(t)]';

% actually possible
% fyrirmynd = csvread('actually_possible.csv');

ferill = progA([x, dx, y, dy], k, m, L, T);

% figure(1)
% plot(ferill(:,1), ferill(:,2))

% til að gera staðsetninguna óháða, hætt við að nota
% ferill = ferill - mean(ferill);
% fyrirmynd = fyrirmynd - mean(fyrirmynd);


% likindi með Discrete Frechet
likindi = DiscreteFrechetDist(ferill, fyrirmynd);

% likindi með rms
% likindi = rms(rms(ferill - fyrirmynd));
% likindi = min(likindi, rms(rms(ferill(end:-1:1, :) - fyrirmynd)));
end

