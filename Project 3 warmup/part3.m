n = 100;
h = 1/n;
lina_0 = [-3, 4, -1]; b_0 = 2*h;
lina_n = [-1, 4, -3]; b_n = 4*h;
[y_lausn, x] = lausn(lina_0, b_0, lina_n, b_n, n);
y_gefid = -1.0074*exp(x) - 2.0074*exp(-x); 

figure(2)
clf
hold on
plot(x,y_lausn)
plot(x, y_gefid)
hold off



