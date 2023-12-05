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
t = 0:40/300:40;
plot(t,[Etotal,U,K,W,Energy_error])
yline(Einitial,'Label','Upphafsorka')
xlabel('Tími [sek]');
ylabel('Orka [Júl]');
legend('Heildarorka','Stöðuorka','Hreyfiorka','Fjaðurorka','Orkutap', 'Location','best');

% Annað graf með subplots
figure(2);
subplot(2,2,1);  % Orkutap
plot(t,Energy_error);
title('Orkutap');
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


