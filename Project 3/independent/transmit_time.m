function [ttime_thresh, ttime_peak, peak] = transmit_time(a, b, threshold)
T = 0.3;
m=1000;
n=1000;
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
[~, j] = max(W(end, :));
ttime_peak = t(j);
j = find(W(end, :) > threshold, 1, 'first');
peak = max(W(end, :));
if isempty(j)
    ttime_thresh = NaN;
%     return
else
    ttime_thresh = t(j);
    figure(1);hold on
    plot3(x(end), t(j), W(end, j), 'r*')
    hold off
end