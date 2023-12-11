% Setjum inn breytur
in = 0; % Bil vinstri punktur
out = 1; % Bil hægri punktur

n = 10; % Hversu mörg bil viljum við

% Jaðarskilyrði
y_in = 2;    %y(in)
y_out = 3;  %y(out)

h = (out-in)/n; % Bilstærð

% Framleiðum A fylkið
A = sparse(n+1);

% Setjum inn fyrstu og seinustu línuna

% Fyllum inn í aðrar línur
hornalinustak = h^2-2;
for rowcol = 2:n
        % Hornalínan hefur h^2 -2 og hægra megin og vinstra megin við
        % hornalínustakið er 1
        A(rowcol, rowcol-1) = 1;
        A(rowcol, rowcol) = hornalinustak;
        A(rowcol, rowcol) = 1;
end % for rowcol (því row = col)


% Framleiðum b vigurinn
b = sparse(n+1, 1);
b(1, 1) = y_in;
b(n+1, 1) = y_out;

disp("Dæmi 2, Dirichlet lausn:");
dirichletlausn(A, b, y_in, y_out)

y_diff_in = 1;
y_diff_out = -2;

disp("Dæmi 3, Neumann lausn:");
neumannlausn(A, b, y_diff_in, y_diff_out)

disp("Dæmi 4, Robin lausn:");
robinlausn(A, b, y_in, y_out)