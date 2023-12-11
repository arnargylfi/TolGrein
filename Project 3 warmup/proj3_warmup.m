% Setjum inn breytur
in = 0; % Bil vinstri punktur
out = 1; % Bil hægri punktur

n = 50; % Hversu mörg bil viljum við

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
y2_gefid = D2_lausn(x);

% Plottum og vistum
figure(1);
plot(x,y, x,y2_gefid);
xlabel('x')
ylabel('y')
title("Dirichlet lausn");
legend("Dirichlet", "Gefin lausn");

% Vista mynd
exportgraphics(gcf,'myndir/dirichlet_Lausn.pdf');


disp("Dæmi 3, Neumann lausn:");
% Setjum upp jaðarskilyrði
y_diff_in = 1;
y_diff_out = -2;
% Framleiðum fylkið A
A(1,1) = -3;A(1,2) = 4; A(1,3) = -1;
A(n+1,n-1) = 1;A(n+1, n)=-4;A(n+1,n+1)=3;
% Framleiðum b vigurinn
b(1,1)=2*h;b(n+1,1)=4*h;
% Leysum
y = A\b;
% Setjum upp gefnu lausnina
y3_gefid = D3_lausn(x);
% Plottum og vistum
figure(2);
plot(x,y, x,y3_gefid);
xlabel('x')
ylabel('y')
title("Neumann lausn");
legend("Neumann", "Gefin lausn");

% Vista mynd
exportgraphics(gcf,'myndir/neumann_Lausn.pdf');


disp("Dæmi 4, Robin lausn:");
% Setjum upp jaðarskilyrði
% Framleiðum fylkið A
% Framleiðum b vigurinn
% Setjum upp gefnu lausnina
% Plottum og vistum
