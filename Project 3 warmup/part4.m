n = 100;
h = 1/n;
lina_0 = [-3-2*h, 4, -1]; b_0 = 2*h;
lina_n = [1, -4, 3+2*h]; b_n = 4*h; 
[y_lausn, x] = lausn(lina_0, b_0, lina_n, b_n, n, h);
y_gefid = 0.36788*exp(x) - 0.5*exp(-x); 

figure(1)
clf
hold on
plot(x,y_lausn)
plot(x, y_gefid)
hold off
hold off
xlabel('x');
ylabel('y');
title("Robin jaðarskilyrði, n = " + n);
legend("Lausn með Bútun", "Gefin lausn");
exportgraphics(gcf, "myndir/part4.pdf")

ns = floor(logspace(1, 5, 50));
for i = 1:length(ns)
    h = 1/ns(i);
    lina_0 = [-3-2*h, 4, -1]; b_0 = 2*h;
    lina_n = [1, -4, 3+2*h]; b_n = 4*h; 
    [y, x] = lausn(lina_0, b_0, lina_n, b_n, ns(i), h);
    y_gefid = 0.36788*exp(x) - 0.5*exp(-x); 
%     figure
%     plot(x, y, x, y_gefid)
%     title(sprintf("n=%i", ns(i)))
    svar(i) = sum(abs(y-y_gefid))/ns(i);
end
figure('Position',[100, 100, 600, 400]); 
clf
loglog(ns, svar);
xlabel('n');ylabel('Skekkja')
title("Robin jaðarskilyrði - Skekkja sem fall af n")
% exportgraphics(gcf, "myndir/part4loglog.pdf")


