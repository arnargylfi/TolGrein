[W, x, t] = indep();

figure(1)
mesh(x, t, W')
xlabel("x")
ylabel("t")

% figure(2)
% plot(t, W(end, :))

i = find(W(end, :) > 0.05, 1, 'first')
hold on
% plot3(x(i), t(i), W(i, end), '^r')
x(i)
t(i)
W(end, i)
plot3(x(end), t(i), W(end,i), '*r')
hold off