function ttime = transmit_time(a, b)
T = 0.3;
m=100;
n=100;
t_rise=0.05; 
t_high=0.01; 
Vmax=0.05;
[W, x, t] = indep(T,m,n, t_rise, t_high, Vmax, a, b);
figure(1)
mesh(x, t, W')
xlabel("x")
ylabel("t")
i = find(W(end, :) > 0.05, 1, 'first');
if isempty(i)
    ttime = NaN
    return
end
ttime = t(i)