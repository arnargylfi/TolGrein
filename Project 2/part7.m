m = 0.2;    % Massi             [kg]
k = 2.5;    % gormfasti         [N/m]
L0 = 1;     % óteygð gormalengd [m]
g = 9.81;   % Þyngdarhröðun     [m/s^2]

% upphafsgildi
s0 = 0;         % Teygja        [m]
theta0 = pi/12; % Horn          [rad]
n = linspace(1,501,100);        % Skrefastærðir
iterations = 1+(501-1)/100;
T = 40;         % Lokatími      [sek]

% leysum með fyrri aðferðum
% for lykkja sem leysir fyrir allar skrefastærðir og vistar niðurstöðuna
for i = 1:iterations:
    w = RKsolver(s0,theta0,T,n(i));

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
    Einitial = Etotal(1);
    Energy_error(i) = abs(Einitial-Etotal);

end % For

plot(n,Energy_error);
yline(Einitial,'Label','Orkutap/skekkja');
xlabel('Skrefafjöldi n');
ylabel('Orka [Júl]');

