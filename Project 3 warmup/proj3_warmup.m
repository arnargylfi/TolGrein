% Setjum inn breytur
in = 0; % Bil vinstri punktur
out = 1; % Bil hægri punktur

n = 10; % Hversu mörg bil viljum við

% Jaðarskilyrði
y_in = 2;    %y(in)
y_out = 3;  %y(out)

h = (out-in)/n; % Bilstærð

% Framleiðum fylkið A
hornalinustak = h^2-2;
A = geraA(n, hornalinustak);
% Setjum inn fyrstu og seinustu línuna
A(1,1) = 1;
A(n+1, n+1) = 1;

% Framleiðum b vigurinn
b = sparse(n+1, 1);
b(1, 1) = y_in;
b(n+1, 1) = y_out;

disp("Dæmi 2, Dirichlet lausn:");
x = linspace(in, out, n+1);
y = A\b;

% Setjum upp gefnu lausnina

% Plottum og vistum
figure(1);
plot(x,y);
xlabel('x')
ylabel('y')
title("Dirichlet lausn");

% Vista mynd
exportgraphics(gcf,'myndir/dirichlet_Lausn.pdf');



y_diff_in = 1;
y_diff_out = -2;

disp("Dæmi 3, Neumann lausn:");
% Setjum upp jaðarskilyrði
% Framleiðum fylkið A
% Setjum upp gefnu lausnina
% Plottum og vistum

disp("Dæmi 4, Robin lausn:");
% Setjum upp jaðarskilyrði
% Framleiðum fylkið A
% Setjum upp gefnu lausnina
% Plottum og vistum
