function [x, y] = lausn(lina_0, b_0, lina_n, b_n, n)
h = 1/n; % Bilstærð
% Framleiðum fylkið A
hornalinustak = -h^2-2;
A = geraA(n, hornalinustak);
% Setjum inn fyrstu og seinustu línuna
A(1,1:3) = lina_0;
A(n+1, n-1:n+1) = lina_n;

% Framleiðum b vigurinn
b = sparse(n+1, 1);
b(1, 1) = b_0;
b(n+1, 1) = b_n;

% Gerum x
x = linspace(0, 1, n+1);
% Finnum lausn y
y = A\b;
end