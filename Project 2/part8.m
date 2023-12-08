tic
close all % Loka öllum gröfum
savetime = true;
tvofaldanir = 8;    % Fjöldi skipta sem við tvöföldum n

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
if not(savetime)
    Energy_error = zeros(tvofaldanir,1);
    nlist = zeros(tvofaldanir + 1, 1);
    h = zeros(tvofaldanir + 1,1);
    for i = 1:(tvofaldanir+1)
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
end % if

plot(nlist, Energy_error);
xticklabels(arrayfun(@num2str, nlist, 'UniformOutput', false));
title('Orkutap/skekkja sem fall af skrefafjölda')
xlabel('Skrefafjöldi n');
ylabel('Orkutap/skekkja [Júl]');

% Vista mynd
%exportgraphics(gcf,'myndir/part8_1.pdf');


figure(2);
loglog(nlist, Energy_error);
grid on
xlabel('Skrefafjöldi n');
ylabel('Orkutap/skekkja [Júl]');
title('Orkutap/skekkja sem fall af skrefafjölda. Log skala graf');
% Vista mynd
%exportgraphics(gcf,'myndir/part8_2.pdf');


figure(3);
loglog(h, Energy_error);
grid on
xlabel('Skrefastærð h');
ylabel('Orkutap/skekkja [Júl]');
title('Orkutap sem fall af skrefastærð. Log skala graf');
% Vista mynd
%exportgraphics(gcf,'myndir/part8_3.pdf');

% Finnum stig aðferðar Runge-Kutta
% Diffrum línu á mynd 1
diffrid = zeros(tvofaldanir,1);
stig = 0;
for i = 1:tvofaldanir
    diffrid(i) = (log(Energy_error(i+1))-log(Energy_error(i)))/(log(h(i+1))-log(h(i)));
    stig = stig + diffrid(i);
end % for

stig/tvofaldanir

figure(4);
plot(0:tvofaldanir-1, diffrid);
title('Diffrað log(Error)');
xlabel('Tvöföldun');
ylabel('Stig aðferðar');

% Vista mynd
%exportgraphics(gcf,'myndir/part8_4.pdf');



toc