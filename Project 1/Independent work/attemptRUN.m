q0 = 10^(-4)*[2;4;3;4;5;4;3;2;3;4;0.01];
d = 10^(-3);

delta_p0 = 1;
D = [0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;d];
rho = 998;
mu = 1.002*10^(-3);
q_result = newtonmult(q0,10^(-7),d,delta_p0)

Reynolds = (4*rho*q_result)./(mu*pi*D);

% Gerum stöplarit til að bera saman niðurstöðurnar úr dæmi 10 við þessar
barplotdata = compare_in_bar_plot_extra(q10, q_result);
bar(barplotdata)
title("Flæðissamanburður")
xlabel("Númer pípu")
ylabel("Flæði [m^3/s]")
legend({"Dæmi 10", "Flæði með gati"}, 'Location', 'north')
