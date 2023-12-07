function part4_plot(s0, theta0, T, titill)
% s0 = 0;
% theta0 = pi/12;
% T = 10;
n = 300;
w = RKsolver(s0,theta0,T,n)
plot(w(:,1),w(:,3))
xlabel('x [m]')
ylabel('y [m]')
% title("s_0 = 0, \theta_0=\pi/12, T=10", 'Interpreter','tex');
% Bæta við upphafspunkti og endapunkti ferils
hold on
plot(w(1,1),w(1,3), 'b<', 'MarkerSize', 10, 'MarkerFaceColor', 'g');   % Upphafspunktur
% text(w(1,1),w(1,3)+0.03,"t = 0", 'fontsize', 14);

plot(w(n+1,1),w(n+1,3),'bsquare', 'MarkerSize', 10, 'MarkerFaceColor', 'r');   % endapunktur
% text(w(n+1,1),w(n+1,3)+0.03,"t = " + T + " sek", 'fontsize', 14);

% Legend
legend('', 't = 0sek', 't = T', 'Location', 'Best')
% Title
title(titill, 'Interpreter','tex');


% Hlutfallslega jafn stórir ásar
daspect([1 1 1])
% Stilla textastærð
set(gca,'FontSize',15)
w_y_diff = max(w(:, 3)) - min(w(:, 3))
ylim([min(w(:,3)) - w_y_diff*0.1, max(w(:,3) + w_y_diff*0.1)])
hold off
end