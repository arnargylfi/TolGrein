function ret = plotstuff(x, y, dx, dy, k, m, L, T, shape)

% shape = shape - 1;
if shape == 1
%hjarta
    f_x = @(t) 16*sin(t).^3;
    f_y = @(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
    t = linspace(0, 2*pi,  100);
    fyrirmynd = [f_x(t); f_y(t)]';
elseif shape == 2
% % % lemniscate (infinity symbol)
    a = 2;
    f_x = @(t) (a*cos(t))./(sin(t).^2 + 1);
    f_y = @(t) (a*sin(t).*cos(t))./(sin(t).^2 + 1) - 2;
    t = linspace(2*pi, 0, 100)+pi/2;
    fyrirmynd = [f_x(t); f_y(t)]';
elseif shape == 3
    % actually possible
    fyrirmynd = csvread('actually_possible.csv');
end

ferill = progA([x, dx, y, dy], k, m, L, T);

% ferill = ferill - mean(ferill);
% fyrirmynd = fyrirmynd - mean(fyrirmynd);

figure(2)
plot(ferill(:,1), ferill(:,2))
hold on
plot(fyrirmynd(:,1), fyrirmynd(:,2))

% for i = 1:100
%     plot([ferill(i, 1), fyrirmynd(i, 1)], [ferill(i, 2), fyrirmynd(i,2)], 'r')
% end
hold off
xlabel("x")
ylabel("y")
legend("DEAP lausnarleit", "Fyrirmynd")
legend('Location', 'southeast')

ret = 1;
