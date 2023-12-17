[W, x, t] = indep();

figure(1)
mesh(x, t, W')
xlabel("x")
ylabel("t")

% figure(2)
% plot(t, W(end, :))
% return
i = find(W(end, :) > 0.025, 1, 'first')
hold on
% plot3(x(i), t(i), W(i, end), '^r')
x(i)
t(i)
W(end, i)
plot3(x(end), t(i), W(end,i), '*r')
hold off

figure(7);clf;hold on
plot(t, W(end, :))
plot(t(i), W(end, i), '*r')
[vmax, i] = max(W(end, :))
plot(t(i), vmax, 'k*')
xlabel("t [s]")
ylabel("Taugahimnuspenna [V]")
title("Spenna sem fall af tíma í mjórri enda taugasímans")
legend(["V(L,t)", "Þröskuldur", "Hágildi"])
exportgraphics(gcf, "../Myndir/indepVend.pdf")
