format long
T= 10^-2;
m = 5000;
n = 5000;
[W, x, t] = D4(T,m,n);
ka = max(W(:, end));
mesh(x, t, W')
xlabel("x [m]")
ylabel("t [s]")
zlabel("V [V]")
exportgraphics(gcf,"Myndir/D5.pdf")

% HREYFIMYND 


for j = 1:n+1
    clf;
    hold on
    w = W(:,j);
    plot(x,w)
    ylim([0,max(max(W))])
    xlabel('x[m]')
    ylabel('V [V]')
    title("t = " +t(j)+"s")
end % for
