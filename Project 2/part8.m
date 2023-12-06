tic
m = 0.2;    % Massi             [kg]
k = 2.5;    % gormfasti         [N/m]
L0 = 1;     % óteygð gormalengd [m]
g = 9.81;   % Þyngdarhröðun     [m/s^2]

% upphafsgildi
s0 = rand([1 9]); %9 random gildi milli 0 og 1
         % Teygja        [m]
theta0 = pi/3*rand([1 9]) ; % 9 random gildi milli 0 og pi/3          [rad]
T = 20+50*rand([1 9]); %Loka tími á milli 20 sek og 70 sek 
n = 400; %Leiðbeiningar samkvæmt verkefnalýsingu, byrjar í 10 T og tvöfaldast í hvert sinn

% leysum með fyrri aðferðum
% for lykkja sem leysir fyrir allar skrefastærðir og vistar niðurstöðuna
Energy_error = zeros(8,1);
for i = 1:9
    w = RKsolver(s0(i),theta0(i),T(i),n);

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
    x0 = (Leq+s0(i))*sin(theta0(i));
    y0 = -(Leq+s0(i))*cos(theta0(i));
    Einitial = m*g*y0+k*(L0-sqrt(x0^2+y0^2))^2/2;
%   Einitial = Etotal(1);
    Energy_error(i) = abs(Einitial-Etotal(n));
    nlist(i) = n;
    n = n*2;
end % For

plot(1:9, Energy_error);
xticklabels(arrayfun(@num2str, nlist, 'UniformOutput', false));
xlabel('Skrefafjöldi n');
ylabel('Orka [Júl]');

% loglog(log(nlist), log(Energy_error));
% xlabel('log(Skrefafjöldi n)');
% ylabel('log(Orkutap/skekkja) [log(Júl)]');

toc
