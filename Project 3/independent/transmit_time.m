function [ttime_thresh, ttime_peak, peak] = transmit_time(a, b, threshold)
T = 0.4;
m=100;
n=100;
t_rise=0.05; 
t_high=0.01; 
Vmax=0.05;
[W, x, t] = indep(T,m,n, t_rise, t_high, Vmax, a, b);
figure(1)
mesh(x, t, W')
xlabel("x [cm]")
ylabel("t [s]")
zlabel("Taugahimnuspenna [V]")
% [~ , i] = min(abs(x-0.04));
[peak, j] = max(W(end, :));
ttime_peak = t(j);
if (peak <0.001)
    ttime_peak = NaN;
end
j = find(W(end, :) > threshold, 1, 'first');
if isempty(j)
    ttime_thresh = NaN;
%     return
else
    ttime_thresh = t(j);
    figure(1);hold on
    plot3(x(end), t(j), W(end, j), 'r*')
    hold off
end