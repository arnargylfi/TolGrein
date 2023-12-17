close all
format long
T= 10^-2;   % sek
m = 5000;   % skrefafjöldi x
n = 5000;   % skrefafjöldi t
hreyfimynd = false; % false sleppir því að gera hreyfimynd, true gerir hreyfimynd.
[W, x, t] = D4(T,m,n);
max_spenna = max(W(:, end))
ka = max(W(:, end));
% Teikna 3D mynd

%%
mesh(x, t, W')
title('Taugahimnuspenna sem fall af tíma og rúmi')
xlabel("x [m]")
ylabel("t [s]")
zlabel("V [V]")
%exportgraphics(gcf,"Myndir/D5.pdf")
exportgraphics(gcf,'C:/Users/valdi/OneDrive/Documents/MATLAB/Lota 3/part5_1.pdf');
%%
% HREYFIMYND
if hreyfimynd
    figure();
    for j = 1:n+1
        clf;
        hold on
        w = W(:,j);
        plot(x,w);
        ylim([0,max(max(W))]);
        xlabel('x[m]');
        ylabel('V [V]');
        title("t = " +t(j)+"s");
    end % for
end % if

disp("Keyrslu lokið");