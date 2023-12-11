
lina_0 = [1, 0, 0]; b_0 = 2;
lina_n = [0, 0, 1]; b_n = 3;

[y_lausn, x] = lausn(lina_0, b_0, lina_n, b_n, 10);
y_gefid = 0.96334*exp(x) + 1.0367*exp(-x);

figure(1)
hold on
plot(x,y_lausn)
plot(x, y_gefid)
hold off


