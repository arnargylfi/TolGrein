tic
close all % Loka öllum gröfum
savetime = false;
tvofaldanir = 4;    % Fjöldi skipta sem við tvöföldum n
s0_randfjoldi = 3;  % Fjöldi mismunandi upphafsteygja sem við prófum
theta0_randfjoldi = 3;  % Fjöldi mismunandi upphafshorna sem við prófum
fjoldi_ferla = s0_randfjoldi*theta0_randfjoldi;
keyrslur = fjoldi_ferla*(tvofaldanir+1);

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
    bar = waitbar(progress/(keyrslur+1), "Loading", 'Name', 'Part 8');
    for s_ind = 1:s0_randfjoldi
        for theta_ind = 1:theta0_randfjoldi
            for i = 1:(tvofaldanir+1)
                h(i) = T/n;
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
                waitbar(progress/(keyrslur+1));
            end % For tvofaldanir
            % Endurstillum skrefafjölda
            n = n0;
        end % For s0
    end % For theta0
    close(bar);   % Close waitbar
end % if

figure("Units","normalized","OuterPosition",[0 0 1 1]);
subplotnumber = 1;
sgtitle('Orkutap/skekkja sem fall af skrefafjölda.');
for s_ind = 1:s0_randfjoldi
    for theta_ind = 1:theta0_randfjoldi
        subplot(s0_randfjoldi, theta0_randfjoldi, subplotnumber)
        loglog(nlist, squeeze(Energy_error(s0_randfjoldi, theta0_randfjoldi, :)));
        grid on;
        xticklabels(arrayfun(@num2str, nlist, 'UniformOutput', false));
        title(strcat('S_0 = ', num2str(s0(s_ind)),'m \theta_0 = ', num2str(theta0(theta_ind))), 'Interpreter','tex');
        xlabel('Skrefafjöldi n');
        ylabel('Orkutap/skekkja [Júl]');

        subplotnumber = subplotnumber + 1;
    end % for theta_ind
end % for s_ind


% Vista mynd
if not(savetime)
    exportgraphics(gcf,'myndir/part8_1.pdf');
end % if

figure("Units","normalized","OuterPosition",[0 0 1 1]);
sgtitle('Orkutap/skekkja sem fall af skrefastærð.');
subplotnumber = 1;
for s_ind = 1:s0_randfjoldi
    for theta_ind = 1:theta0_randfjoldi
        subplot(s0_randfjoldi, theta0_randfjoldi, subplotnumber);
        loglog(h, squeeze(Energy_error(s0_randfjoldi, theta0_randfjoldi, :)));
        grid on
        xticklabels(arrayfun(@num2str, h, 'UniformOutput', false));
        title(strcat('S_0 = ', num2str(s0(s_ind)),'m \theta_0 = ', num2str(theta0(theta_ind))), 'Interpreter','tex');
        xlabel('Skrefastærð h');
        ylabel('Orkutap/skekkja [Júl]');
        subplotnumber = subplotnumber + 1;
    end % for theta0
end % for s0
    
% Vista mynd
if not(savetime)
    exportgraphics(gcf,'myndir/part8_2.pdf');
end % if

% Finnum stig aðferðar Runge-Kutta
% Diffrum línu á mynd 1
diffrid = zeros(tvofaldanir,1);
stig = zeros(s0_randfjoldi, theta0_randfjoldi);
for s_ind = 1:s0_randfjoldi
    for theta_ind = 1:theta0_randfjoldi
        for i = 1:tvofaldanir
            diffrid(s_ind, theta_ind, i) = (log(Energy_error(s_ind, theta_ind, i+1))-log(Energy_error(s_ind, theta_ind, i)))/(log(h(i+1))-log(h(i)));
            stig(s_ind, theta_ind) = stig(s_ind, theta_ind) + diffrid(i);
        end % for tvofaldanir
        
        stig(s_ind, theta_ind) = stig(s_ind, theta_ind)/tvofaldanir;

    end % for theta
end % for s


figure("Units","normalized","OuterPosition",[0 0 1 1]);
sgtitle('Diffrað log(Error)');
subplotnumber = 1;
for s_ind = 1:s0_randfjoldi
    for theta_ind = 1:theta0_randfjoldi
        subplot(s0_randfjoldi, theta0_randfjoldi, subplotnumber);

        plot(0:tvofaldanir-1, squeeze(diffrid(s_ind, theta_ind, :)));
        title(strcat('S_0 = ', num2str(s0(s_ind)),'m \theta_0 = ', num2str(theta0(theta_ind))), 'Interpreter','tex');
        ylabel('Stig aðferðar');
        xlabel('Tvöföldun');
        subplotnumber = subplotnumber + 1;
    end % for theta0
end % for s0

% Vista mynd
if not(savetime)
    exportgraphics(gcf,'myndir/part8_4.pdf');
end % If

% Skrifum gögnin í CSV skrá
header = {'s0', 'theta0', 'Tvöfaldanir', 'h', 'n', 'Error'};
% Samkeyra gogn í eitt fylki
gogn = zeros(keyrslur, 6);
lina = 0;
for s_ind = 1:s0_randfjoldi
    for theta_ind = 1:theta0_randfjoldi
        for i = 0:tvofaldanir
            lina = lina + 1;
            gogn(lina, 1) = s0(s_ind);
            gogn(lina, 2) = theta0(theta_ind);
            gogn(lina, 3) = i;
            gogn(lina, 4) = h(i+1);
            gogn(lina, 5) = nlist(i+1);
            gogn(lina, 6) = Energy_error(s_ind, theta_ind, i+1);            
        end % for tvofaldanir
    end % for theta
end % for s

cell = [header; num2cell(gogn)];
filename =  strcat('gogn/part8_', num2str(tvofaldanir), ' tvofaldanir.csv');
writecell(cell, filename);

toc