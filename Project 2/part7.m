tic
close all % Loka öllum gröfum
savetime = true;
tvofaldanir = 8;    % Fjöldi skipta sem við tvöföldum n

m = 0.2;    % Massi             [kg]
k = 2.5;    % gormfasti         [N/m]
L0 = 1;     % óteygð gormalengd [m]
g = 9.81;   % Þyngdarhröðun     [m/s^2]

% upphafsgildi
s0 = 0;         % Teygja        [m]
theta0 = pi/12; % Horn          [rad]
T = 40;         % Lokatími      [sek]
n = 10*T; %Leiðbeiningar samkvæmt verkefnalýsingu, byrjar í 10 T og tvöfaldast í hvert sinn


% leysum með fyrri aðferðum
% for lykkja sem leysir fyrir allar skrefastærðir og vistar niðurstöðuna
if not(savetime)
    Energy_error = zeros(tvofaldanir + 1,1);
    nlist = zeros(tvofaldanir + 1, 1);
    h = zeros(tvofaldanir + 1,1);
    for i = 1:(tvofaldanir+1)
        h(i) = T/n;
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
        Einitial = m*g*y0+k*(L0-sqrt(x0^2+y0^2))^2/2;
    %     Einitial = Etotal(1);
        Energy_error(i) = abs(Etotal(n)-Einitial);
        nlist(i) = n;
        n = n*2;

        % Progress report
        fprintf('%.0f %%\n', 100*i/(tvofaldanir+1));
    end % For
end % if

loglog(nlist, Energy_error);
grid on
xlabel('Skrefafjöldi n');
ylabel('Orkutap/skekkja [Júl]');
title('Orkutap sem fall af skrefafjölda. Log skala graf');
% Vista mynd
exportgraphics(gcf,'myndir/part7_1.pdf');

figure(2);
loglog(h, Energy_error);
grid on
xlabel('Skrefastærð h');
ylabel('Orkutap/skekkja [Júl]');
title('Orkutap sem fall af skrefastærð. Log skala graf');
% Vista mynd
exportgraphics(gcf,'myndir/part7_2.pdf');

% Finnum stig aðferðar Runge-Kutta
logh = log10(h);
halli_og_fasti = Energy_error;
halli_og_fasti = log10(halli_og_fasti);
halli_og_fasti = halli_og_fasti/logh;

figure(3);
plot(0:tvofaldanir,halli_og_fasti);
title('Stig + log(C)/log(h)');
xlabel('Ítrun á tvöföldun ');
ylabel('log(Error)/log(h)');

% Vista mynd
exportgraphics(gcf,'myndir/part7_3.pdf');


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
exportgraphics(gcf,'myndir/part7_4.pdf');

% Reiknum hallatöluna út frá bestu línu í log-log grafinu
figure(5);
p = polyfit(log(nlist), log(Energy_error), 1); % p(1) inniheldur hallann
% Plottum upp
loglog(nlist, Energy_error, 'o-');
hold on;
% Plottum bestu línu 
loglog(nlist, exp(polyval(p, log(nlist))), '-');
xlabel('Skrefafjöldi n');
ylabel('Orkutap/Skekkja Error');
%legend('Error(n)','Besta lína');
legend('Error(n)', ['Besta lína (halli: ', num2str(p(1)), ')']);
title('Orkutap sem fall af skrefafjölda. Log skala graf. ');
grid on;
hold off;
% Vista mynd
exportgraphics(gcf,'myndir/part7_5.pdf');
% Prentum hallann
disp(['Hallatala línunnar er: ', num2str(p(1))]);

% Reiknum hallatöluna af Error(h) út frá bestu línu í log-log grafinu
figure(6);
p = polyfit(log(h), log(Energy_error), 1); % p(1) inniheldur hallann
% Plottum upp
loglog(h, Energy_error, 'o-');
hold on;
% Plottum bestu línu 
loglog(h, exp(polyval(p, log(h))), '-');
xlabel('Skrefastærð h');
ylabel('Orkutap/Skekkja Error');
%legend('Error(h)','Besta lína');
legend('Error(h)', ['Besta lína (halli: ', num2str(p(1)), ')']);
title('Orkutap sem fall af skrefastærð. Log skala graf. ');
grid on;
hold off;
% Vista mynd
exportgraphics(gcf,'myndir/part7_6.pdf');
% Prentum hallann
disp(['Hallatala línunnar er: ', num2str(p(1))]);

toc