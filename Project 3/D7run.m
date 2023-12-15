% Endurtökum spurningar 2,3 og 5 með breytilegu þvermáli. Spurning 2 og 3
% eru leyst í skýrslunni.
% Spurning 5
close all
format long
% Teikna allt sem 3D mynd og hreyfimynd
hreyfimynd = false;  % false til að sleppa því að teikna hreyfimynd, true til að teikna hreyfimynd
a = 4.9466*10^(-6);  % [m] Tekið úr D6_VO.m
b = 5.7309*10^(-5);  % [m] Tekið úr D6_VO.m

L = 0.04*10^(-2); % [m]
T = 10^-2;   % [sek]
m = 5000;   % skrefafjöldi x
n = m;   % skrefafjöldi t
[W, x, t] = D7(T,m,n);
max_spenna = max(W(:, end));
% Teikna 3D mynd
figure(1)
mesh(x, t, W')
xlabel("x [m]");
ylabel("t [s]");
zlabel("V [V]");
% Vista mynd
exportgraphics(gcf,"Myndir/D7_1.pdf");

% HREYFIMYND
if hreyfimynd
    figure();
    for j = 1:n+1
        clf;
        hold on
        w = W(:,j);
        plot(x,w)
        ylim([0,max(max(W))])
        xlabel('x[m]')
        ylabel('V [V]')
        title("t = " +t(j)+"s")
        pause(0);
    end % for
end % if

% Vistum 4 ramma úr hreyfimyndinni með jöfnu millibili.
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1); % Upphafsrammi þegar t=0
plot(x,W(:,1));
title("Taugahimnuspenna við t = " + num2str(t(1)) + " sek");
xlabel('x [m]');
ylabel('Spenna [V]');
subplot(2,2,2); % Upphafsrammi þegar t=T/3
skref = round((n+1)/3);
plot(x,W(:,skref));
title("Taugahimnuspenna við t = T/3 = " + t(skref) + " sek");
xlabel('x [m]');
ylabel('Spenna [V]');
subplot(2,2,3); % Upphafsrammi þegar t=2T/3
skref = round(2*(n+1)/3);
plot(x,W(:,skref));
title("Taugahimnuspenna við t = 2T/3 = " + t(skref) + " sek");
xlabel('x [m]');
ylabel('Spenna [V]');
subplot(2,2,4); % Upphafsrammi þegar t=T
plot(x,W(:,n+1));
title("Taugahimnuspenna við t = T = " + t(n+1) + " sek");
xlabel('x [m]');
ylabel('Spenna [V]');

% Vista mynd
exportgraphics(gcf,'myndir/D7_2.pdf');

% % Teiknum nálgunina á frumunni upp og látum litin tákna spennuna þegar t=T
% figure();
% d = sigmoid(x, L, a, b);
% r = d/2;
% [X, Y, Z] = cylinder(r,50);
% Z = Z*L;
% C = W(:,m+1);
% surf(X,Y,Z);
% %surf(X,Y,Z,C);
% title("Nálgun á taugafrumu með sigmoid þrepafalli");
% xlabel("Hæð [m]");
% ylabel("Breidd [m]");
% zlabel("Lengd [m]");
% h = get(gca,'DataAspectRatio');
% set(gca,'DataAspectRatio',[1 1 h(3)]);