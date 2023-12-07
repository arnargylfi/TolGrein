t = linspace(0, 2*pi, 100);
x = 16*sin(t).^3;
y = 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);

plot(x, y)