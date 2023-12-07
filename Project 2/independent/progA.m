function ferill = progA(w0, k, m, T)
n = 99;
w = RKsolver(w0, k, m, T, n);
ferill = [w(:,1), w(:, 3)];
end
