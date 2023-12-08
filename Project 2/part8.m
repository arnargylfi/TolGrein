tic
close all % Loka öllum gröfum
savetime = false;
tvofaldanir = 4;    % Fjöldi skipta sem við tvöföldum n
s0_randfjoldi = 3;  % Fjöldi mismunandi upphafsteygja sem við prófum
theta0_randfjoldi = 3;  % Fjöldi mismunandi upphafshorna sem við prófum
fjoldi_ferla = s0_randfjoldi*theta0_randfjoldi;
keyrslur = fjoldi_ferla*tvofaldanir;

m = 0.2;    % Massi             [kg]
k = 2.5;    % gormfasti         [N/m]
L0 = 1;     % óteygð gormalengd [m]
g = 9.81;   % Þyngdarhröðun     [m/s^2]

% upphafsgildi
s0 = 2*L0*(rand([1 s0_randfjoldi])-0.5); %random teygja frá -L0 upp í +L0 % Teygja        [m]
theta0 = 2*pi*(rand([1 theta0_randfjoldi])-0.5) ; % 9 random gildi milli 0 og pi (hámarkshornið okkar)          [rad]
T = 40; %Loka tími
n0 = 10*T; %Leiðbeiningar samkvæmt verkefnalýsingu, byrjar í 10 T og tvöfaldast í hvert sinn
n = n0;

% leysum með fyrri aðferðum
% for lykkja sem leysir fyrir allar skrefastærðir og vistar niðurstöðuna
if not(savetime)
    Energy_error = zeros(s0_randfjoldi, theta0_randfjoldi, tvofaldanir);
    nlist = zeros(tvofaldanir + 1, 1);
    h = zeros(tvofaldanir + 1,1);
    progress = 0;

    % For lykkja fyrir öll mismunandi upphafsskilyrði
    for s_ind = 1:s0_randfjoldi
        for theta_ind = 1:theta0_randfjoldi
            for i = 1:(tvofaldanir+1)
                w = RKsolver(s0(s_ind),theta0(theta_ind),T,n);
            
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
                x0 = (Leq+s0(s_ind))*sin(theta0(theta_ind));
                y0 = -(Leq+s0(s_ind))*cos(theta0(theta_ind));
                Einitial = m*g*y0+k*(L0-sqrt(x0^2+y0^2))^2/2;
            %   Einitial = Etotal(1);
                Energy_error(s_ind, theta_ind,i) = abs(Einitial-Etotal(n));
                nlist(i) = n;
                n = n*2;
        
                % Progress report
                progress = progress + 1;
                %fprintf('\b\b\b\b\b %.0f %%', 100*progress/(keyrslur+1));
                bar = waitbar(progress/(keyrslur+1), "Loading");
            end % For tvofaldanir
            % Endurstillum skrefafjölda
            n = n0;
        end % For s0
    end % For theta0
    close bar   % Close waitbar
end % if

plot(nlist, Energy_error);
xticklabels(arrayfun(@num2str, nlist, 'UniformOutput', false));
title('Orkutap/skekkja sem fall af skrefafjölda')
xlabel('Skrefafjöldi n');
ylabel('Orkutap/skekkja [Júl]');

% Vista mynd
exportgraphics(gcf,'myndir/part8_1.pdf');


figure(2);
loglog(nlist, Energy_error);
grid on
xlabel('Skrefafjöldi n');
ylabel('Orkutap/skekkja [Júl]');
title('Orkutap/skekkja sem fall af skrefafjölda. Log skala graf');
% Vista mynd
exportgraphics(gcf,'myndir/part8_2.pdf');


figure(3);
loglog(h, Energy_error);
grid on
xlabel('Skrefastærð h');
ylabel('Orkutap/skekkja [Júl]');
title('Orkutap sem fall af skrefastærð. Log skala graf');
% Vista mynd
exportgraphics(gcf,'myndir/part8_3.pdf');

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
exportgraphics(gcf,'myndir/part8_4.pdf');

% Skrifum gögnin í CSV skrá
header = {'Tvöfaldanir', 'h', 'n', 'Error'};
gogn = [[0:tvofaldanir]' h nlist Energy_error];
cell = [header; num2cell(gogn)];
filename =  strcat('gogn/part8_', num2str(tvofaldanir), ' tvofaldanir.csv');
writecell(cell, filename);

toc