close all % Loka öllum gröfum
% 3 gröf með mismunandi gildi
figure(1)
sgtitle('Dæmi 4'); % Aðaltitill
T = 20;

% Graf 1
figure(1)
s0 = 0;
theta0 = pi/12; % Muna að skrifa líka í titil grafs
part4_plot(s0, theta0, T, "s_0 = " + s0 + "      \theta_0 = \pi/12      T = " + T);
% Legend
xloc = 0.7; yloc = 0.3; width = 0.1; height = 0.1;
legend('', 't = 0sek', 't = T', 'Position', [xloc yloc width height]);
% Vista mynd
exportgraphics(gca,'myndir/part4_1.pdf');

% Graf 2
figure(2)
s0 = -0.2;
theta0 = -pi/10; % Muna að skrifa líka í titil grafs
part4_plot(s0, theta0, T,"s_0 = " + s0 + "      \theta_0 = -\pi/10      T = " + T);
% Legend
legend('', 't = 0sek', 't = T', 'Location', 'Best')
% Vista mynd
exportgraphics(gca,'myndir/part4_2.pdf');

% Graf 3
figure(3)
s0 = 0.2;
theta0 = pi/9; % Muna að skrifa líka í titil grafs
part4_plot(s0, theta0, T, "s_0 = " + s0 + "      \theta_0 = \pi/9      T = " + T);
% Legend
xloc = 0.7; yloc = 0.25; width = 0.1; height = 0.1;
legend('', 't = 0sek', 't = T', 'Position', [xloc yloc width height]);
% Vista mynd
exportgraphics(gca,'myndir/part4_3.pdf');