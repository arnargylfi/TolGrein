s0 = 0;
theta0 = pi/12;
T = 10;
n = 300;
w = RKsolver(s0,theta0,T,n)
plot(w(:,1),w(:,3))
xlabel('x [m]')
ylabel('y [m]')
title("Pendúll dæmi 4");
% Bæta við upphafspunkti og endapunkti ferils
hold on
plot(w(1,1),w(1,3),'r*');   % Upphafspunktur
text(w(1,1),w(1,3)+0.03,"t = 0 sek", 'fontsize', 14);

plot(w(n+1,1),w(n+1,3),'r*');   % Upphafspunktur
text(w(n+1,1),w(n+1,3)+0.03,"t = " + T + " sek", 'fontsize', 14);

% Hlutfallslega jafn stórir ásar
daspect([1 1 1])
% Stilla textastærð
set(gca,'FontSize',15)
hold off