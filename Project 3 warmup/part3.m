
lina_0 = [1, 0, 0]; b_0 = 2;
lina_n = [0, 0, 1]; b_n = 3;

[x, y] = lausn(lina_0, b_0, lina_n, b_n, 10);

plot(x,y)