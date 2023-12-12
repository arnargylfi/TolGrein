close all
format long
T= 10^-2;   % sek
m = 5000;   % skrefafjöldi x
n = 5000;   % skrefafjöldi t
[W, x, t] = D4(T,m,n);
ka = max(W(:, end));
% Teikna 3D mynd
mesh(x, t, W')
xlabel("x [m]")
ylabel("t [s]")
zlabel("V [V]")
exportgraphics(gcf,"Myndir/D5.pdf")

% HREYFIMYND
figure(2);
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

disp("Keyrslu lokið");
