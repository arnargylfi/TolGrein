function svar = skekkja(lina_0, b_0, lina_n, b_n, c1, c2, ns)

for i = 1:length(ns)
    [y, x] = lausn(lina_0, b_0, lina_n, b_n, ns(i));
    y_gefid = c1*exp(x) + c2*exp(-x);
    figure
    plot(x, y, x, y_gefid)
    title(sprintf("n=%i", ns(i)))
    svar(i) = sum(abs(y-y_gefid'))/ns(i);
end

end
