close all
format long
T= 10^-2;   % sek
m = 100;    % skrefafjöldi x
n = 100;    % skrefafjöldi t
[W, x, t] = D4(T,m,n);
max_spenna = max(W(:, end))
% Teikna 3D mynd
mesh(x, t, W')
xlabel("x [cm]");
ylabel("t [s]");
zlabel("Taugahimnuspenna [V]");
% exportgraphics(gcf,"Myndir/D4.pdf");

% HREYFIMYND 

% 
% for j = 1:n+1
%     clf;
%     hold on
%     w = W(:,j);
%     plot(x,w)
%     ylim([0,max(max(W))])
%     xlabel('x[m]')
%     ylabel('V [V]')
%     title("t = " +t(j)+"s")
%     pause(0.1);
% end % for
