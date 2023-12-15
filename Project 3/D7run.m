close all
format long
T= 10^-2;   % sek
m = 1500;    % skrefafjöldi x
n = 1500;    % skrefafjöldi t
[W, x, t] = D7(T,m,n);
max_spenna = max(W(:, end));
% Teikna 3D mynd
figure(1)
mesh(x, t, W')
xlabel("x [m]");
ylabel("t [s]");
zlabel("V [V]");
% exportgraphics(gcf,"Myndir/D4.pdf")

% HREYFIMYND 
return
figure(2)
for j = 1:n+1
    clf;
    hold on
    w = W(:,j);
    plot(x,w)
    ylim([0,max(max(W))])
    xlabel('x[m]')
    ylabel('V [V]')
    title("t = " +t(j)+"s")
    pause(0.1);
end % for
