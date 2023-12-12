close all
d = 0.0002; % cm
L = 0.04; % cm

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

