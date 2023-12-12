format long
T= 10^-2;
m = 100;
n = 100;
[W, x, t] = D4(T,m,n);
ka = max(W(:, end))
mesh(x, t, W')
xlabel("x [m]")
ylabel("t [s]")
zlabel("V [V]")
exportgraphics(gcf,"Myndir/D4.pdf")