% Setjum inn breytur
in = 0; % Bil vinstri punktur
out = 1; % Bil hægri punktur

n = 10; % Hversu mörg bil viljum við

disp("Dæmi 2, Dirichlet lausn:");
% Jaðarskilyrði
y_in = 2;    %y(in)
y_out = 3;  %y(out)

lina_0 = [1, 0, 0]; b_0 = y_in;
lina_n = [0, 0, 1]; b_n = y_out;    % Seinustu 3 stök í linu n fylki A

[y2, x] = lausn(lina_0, b_0, lina_n, b_n, 10);

% Setjum upp gefnu lausnina
y2_gefid = D2_lausn(x)';

% Plottum og vistum
figure(1);
p1 = plot(x,y2, x,y2_gefid);
%p(1).LineWidth = 10;
%p(2).LineWidth = 5;
xlabel('x');
ylabel('y');
title("Dirichlet lausn");
legend("Dirichlet", "Gefin lausn");

% Vista mynd
exportgraphics(gcf,'myndir/dirichlet_Lausn.pdf');


disp("Dæmi 3, Neumann lausn:");
% Setjum upp jaðarskilyrði
y_diff_in = 1;
y_diff_out = -2;

% Fylki A og vigur b
lina_0 = [-3, 4, -1]; b_0 = 2*h;
lina_n = [1, -4, 3]; b_n = 4*h;    % Seinustu 3 stök í linu n fylki A

% Leysum
y3 = lausn(lina_0, b_0, lina_n, b_n, 10);

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
A(1,1) = -3-2*h;A(1,2) = 4; A(1,3) = -1;
A(n+1,n-1) = 1;A(n+1, n)=-4;A(n+1,n+1)=3;
% Framleiðum b vigurinn
b(1,1)=2*h;b(n+1,1)=4*h;
% Leysum
y = A\b;
% Setjum upp gefnu lausnina
y4_gefid = D4_lausn(x);
% Plottum og vistum
figure(3);
plot(x,y, x,y4_gefid);
xlabel('x')
ylabel('y')
title("Robin lausn");
legend("Robin", "Gefin lausn");

% Vista mynd
exportgraphics(gcf,'myndir/robin_Lausn.pdf');
