a = 0.0049466;
b = -0.00573094;

% ttime = transmit_time(a, b)

Nb = 40;
bspace = linspace(-0.0005, -0.02, Nb);
x = linspace(0, 0.04, 100);

% plot the shapes, d(x)
figure(4);clf;hold on

ttime = 0;
for i = 1:Nb
    ttime(i) = transmit_time(a, bspace(i));
    figure(4)
    plot(x, a./(1 + exp(-(x-L/2)/bspace(i))))
    figure(1)
end
figure(3)
plot(bspace, ttime)