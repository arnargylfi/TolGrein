n = 10;
lina_0 = [1, 0, 0]; b_0 = 2;
lina_n = [0, 0, 1]; b_n = 3;

[y_lausn, x] = lausn(lina_0, b_0, lina_n, b_n, n, 1/n);
y_gefid = 0.96334*exp(x) + 1.0367*exp(-x);

figure(1)
hold on
plot(x,y_lausn)
plot(x, y_gefid)
hold off
xlabel('x');
ylabel('y');
title("Dirichlet jaðarskilyrði, n = " + n);
legend("Lausn með Bútun", "Gefin lausn");
exportgraphics(gcf, "myndir/part2.pdf")


ns = floor(logspace(1, 5, 50));
for i = 1:length(ns)
    h = 1/ns(i);
    lina_0 = [1, 0, 0]; b_0 = 2;
    lina_n = [0, 0, 1]; b_n = 3;
    [y, x] = lausn(lina_0, b_0, lina_n, b_n, ns(i), h);
    y_gefid = 0.96334*exp(x) +1.03666*exp(-x);
%     figure
%     plot(x, y, x, y_gefid)
%     title(sprintf("n=%i", ns(i)))
    svar(i) = sum(abs(y-y_gefid))/ns(i);
end
figure('Position',[100, 100, 600, 400]); 
clf
loglog(ns, svar);
xlabel('n');ylabel('Skekkja')
title("Dirichlet jaðarskilyrði - Skekkja sem fall af n")
% exportgraphics(gcf, "myndir/part2loglog.pdf")


