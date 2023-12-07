m = 0.2;    % Massi             [kg]
k = 2.5;    % gormfasti         [N/m]
L0 = 1;     % óteygð gormalengd [m]
g = 9.81;   % Þyngdarhröðun     [m/s^2]

% upphafsgildi
s0 = -9*L0/11;         % Teygja        [m]
theta0 = pi/3; % Horn          [rad]
n = 300;        % Skrefastærð   
T = 40;         % Lokatími      [sek]
% leysum með fyrri aðferðum
w = RKsolver(s0,theta0,T,n);

% til að einfalda jöfnurnar, drögum út:
x = w(:,1); dx = w(:,2); y = w(:,3); dy = w(:,4);

% Stöðuorka
U = m*g*y;

% Hreyfiorka 
K = 0.5*m*(dx.^2+dy.^2); % verkefnalýsing er vitlaus

% Fjaðurorka
W = 0.5*k*(L0-sqrt(x.^2+y.^2)).^2;

Etotal = U+K+W;

Leq = L0 + (m*g)/k;
x0 = (Leq+s0)*sin(theta0);
y0 = -(Leq+s0)*cos(theta0);
% Einitial = -m*g*y0+k*(L0-sqrt(x0^2+y0^2))^2/2;
Einitial = Etotal(1)

Energy_error = abs(Einitial-Etotal);
t = 0:40/n:40;
plot(t,[Etotal,U,K,W,Energy_error])
title(['Orkugreining pendúls, n = ', num2str(n)]);
yline(Einitial,'Label','Upphafsorka')
xlabel('Tími [sek]');
ylabel('Orka [Júl]');
%legend('Heildarorka','Stöðuorka','Hreyfiorka','Fjaðurorka','Orkutap/Skekkja', 'Location','best');
[h_legend, h_objects]=legend('Heildarorka','Stöðuorka','Hreyfiorka','Fjaðurorka','Orkutap/Skekkja','Location','northwest')
set(h_legend, 'FontSize', 3);
pos = get(h_legend, 'Position');
pos(3) = pos(3) * 1.6; % Reduce width by 25%
pos(4) = pos(4) * 0.4; % Reduce height by 25%
set(h_legend, 'Position', pos);

% Annað graf með subplots
figure(2);
% Super title
sgtitle(['n = ', num2str(n)]);
subplot(2,2,1);  % Orkutap/Skekkja
plot(t,Energy_error);
title('Orkutap/Skekkja');
xlabel('Tími [sek]');
ylabel('Orka [Júl]')

subplot(2,2,2);  % Stöðuorka
plot(t,U);
title('Stöðuorka');
xlabel('Tími [sek]');
ylabel('Orka [Júl]')

subplot(2,2,3);  % Hreyfiorka
plot(t,K);
title('Hreyfiorka')
xlabel('Tími [sek]');
ylabel('Orka [Júl]')

subplot(2,2,4);  % Fjaðurorka
plot(t,W);
title('Fjaðurorka');
xlabel('Tími [sek]');
ylabel('Orka [Júl]')


% Aftur með mun stærra n
%----------------------------------------------------------------------------
n = n*2;        % Skrefastærð   
% leysum með fyrri aðferðum
w = RKsolver(s0,theta0,T,n);

% til að einfalda jöfnurnar, drögum út:
x = w(:,1); dx = w(:,2); y = w(:,3); dy = w(:,4);

% Stöðuorka
U = m*g*y;

% Hreyfiorka 
K = 0.5*m*(dx.^2+dy.^2); % verkefnalýsing er vitlaus

% Fjaðurorka
W = 0.5*k*(L0-sqrt(x.^2+y.^2)).^2;

Etotal = U+K+W;

Leq = L0 + (m*g)/k;
x0 = (Leq+s0)*sin(theta0);
y0 = -(Leq+s0)*cos(theta0);
% Einitial = -m*g*y0+k*(L0-sqrt(x0^2+y0^2))^2/2;
Einitial = Etotal(1)

Energy_error = abs(Einitial-Etotal);
t = 0:40/n:40;
figure(3);
plot(t,[Etotal,U,K,W,Energy_error])
yline(Einitial,'Label','Upphafsorka')
title(['Orkugreining pendúls, n = ', num2str(n)]);
xlabel('Tími [sek]');
ylabel('Orka [Júl]');
%legend('Heildarorka','Stöðuorka','Hreyfiorka','Fjaðurorka','Orkutap/Skekkja', 'Location','best');
[k_legend, k_objects]=legend('Heildarorka','Stöðuorka','Hreyfiorka','Fjaðurorka','Orkutap/Skekkja','Location','northwest')
set(k_legend, 'FontSize', 3);
pos = get(k_legend, 'Position');
pos(3) = pos(3) * 1.6; % Reduce width by 25%
pos(4) = pos(4) * 0.4; % Reduce height by 25%
set(k_legend, 'Position', pos);

% Annað graf með subplots
figure(4);
% Super title
sgtitle(['n = ', num2str(n)]);
subplot(2,2,1);  % Orkutap/Skekkja
plot(t,Energy_error);
title('Orkutap/Skekkja');
xlabel('Tími [sek]');
ylabel('Orka [Júl]')

subplot(2,2,2);  % Stöðuorka
plot(t,U);
title('Stöðuorka');
xlabel('Tími [sek]');
ylabel('Orka [Júl]')

subplot(2,2,3);  % Hreyfiorka
plot(t,K);
title('Hreyfiorka')
xlabel('Tími [sek]');
ylabel('Orka [Júl]')

subplot(2,2,4);  % Fjaðurorka
plot(t,W);
title('Fjaðurorka');
xlabel('Tími [sek]');
ylabel('Orka [Júl]')
