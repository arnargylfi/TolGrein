% 3 gröf með mismunandi gildi
figure(1)
sgtitle('Dæmi 4'); % Aðaltitill
T = 20;

% Graf 1
figure(1)
s0 = 0;
theta0 = pi/12; % Muna að skrifa líka í titil grafs
part4_plot(s0, theta0, T)
title("s_0 = " + s0 + "      \theta_0 = \pi/12      T = " + T, 'Interpreter','tex');


% Graf 2
figure(2)
s0 = -0.2;
theta0 = -pi/10; % Muna að skrifa líka í titil grafs
part4_plot(s0, theta0, T)
title("s_0 = " + s0 + "      \theta_0 = -\pi/10      T = " + T, 'Interpreter','tex');

% Graf 3
figure(3)
s0 = 0.2;
theta0 = pi/9; % Muna að skrifa líka í titil grafs
part4_plot(s0, theta0, T)
title("s_0 = " + s0 + "      \theta_0 = \pi/9      T = " + T, 'Interpreter','tex');
