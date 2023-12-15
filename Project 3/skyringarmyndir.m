close all
d = 0.0002*10^(-2); % [m] 0.0002 cm
L = 0.04*10^(-2); % [m] 0.04cm

% Teikna upp nálgun á taugafrumu
r = d/2;
[X, Y, Z] = cylinder(r,100);
Z = Z*L;
C = X;
surf(X,Y,Z,C);
title("Nálgun á taugafrumu sem sívalning");
xlabel("Hæð [cm]");
ylabel("Breidd [cm]");
zlabel("Lengd [cm]");
h = get(gca,'DataAspectRatio');
set(gca,'DataAspectRatio',[1 1 h(3)]);

exportgraphics(gcf,"Myndir/taugafruma_nalgun1.pdf")

% Nálgun 2 - Sigmoid
x = 0:L/4:L;        % [m]
a = 4.9466*10^(-6);  % [m] Tekið úr D6_VO.m
b = 5.7309*10^(-5);  % [m] Tekið úr D6_VO.m
d = sigmoid(x, L, a, b);
r = d/2;

figure(2);
[X, Y, Z] = cylinder(r,100);
Z = Z*L;
C = X;
surf(X,Y,Z,C);
title("Nálgun á taugafrumu með sigmoid þrepafalli");
xlabel("Hæð [cm]");
ylabel("Breidd [cm]");
zlabel("Lengd [cm]");
h = get(gca,'DataAspectRatio');
set(gca,'DataAspectRatio',[1 1 h(3)]);

exportgraphics(gcf,"Myndir/taugafruma_nalgun2.pdf")

