
T = 0.3;
t_rise = 0.1;
t_high = 0.05;
t = linspace(0, T, 1000);
Vmax = 0.05;
V = V0(t, t_rise, t_high, Vmax);

plot(t, V)
title("V(0, t)")
ylabel("V [V]")
xlabel("t [s]")
ylim([0, 0.055])
exportgraphics(gcf, "../Myndir/indep_V0.pdf")
