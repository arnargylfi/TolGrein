function A = geraA(n, hornalinustak)
% Skilar fylki A með hornalinu staki á hornalinunni og 1 við hliðina á þeim
% stökum. Setur ekkert í fyrstu eða neðstu línuna.

% Framleiðum A fylkið
A = sparse(n+1, n+1);
for rowcol = 2:n
    % Hornalínan hefur h^2 -2 og hægra megin og vinstra megin við
    % hornalínustakið er 1
    A(rowcol, rowcol-1) = 1;
    A(rowcol, rowcol) = hornalinustak;
    A(rowcol, rowcol+1) = 1;
end % for rowcol (því row = col)
end