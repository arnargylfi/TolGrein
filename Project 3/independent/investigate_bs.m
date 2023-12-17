function [mintime_peak, mintime_thresh, b_peak, b_thresh] = investigate_bs(R_0)
% define the threshold voltage for other end
threshold = 0.025;

% construct the search space for b
Nb = 20;
% bspace = linspace(-0.001, -0.0165, Nb);
bspace = linspace(-0.005, -0.008, Nb);
% define the volume of the dendrite
% R_0 = 3.5e-7;
L = 0.04;
% find a according to equation (46), 

% a = @(b) 0.00049466;
a = @(b) sqrt(2*R_0/(L - 2* b* tanh(L/(4*b))));


% plot the shapes, d(x)
x = linspace(0, 0.04, 100);
figure(4);clf;hold on
legends = [""];
for i = 1:Nb
    plot(x, a(bspace(i))./(1 + exp(-(x-L/2)/bspace(i))))
    legends(i) = sprintf("b = %.4f", bspace(i));
end
legends
legend(legends);
xlabel("x[cm]")
ylabel("Þvermál taugasímans [cm]")
exportgraphics(gcf, "../Myndir/indepsigmoids.pdf");


% calculate the transit times for each b
ttime_thresh = 0;
ttime_peak = 0;
peaks = 0;
for i = 1:Nb
    [ttt, ttp, peak] = transmit_time(a(bspace(i)), bspace(i), threshold);
    ttime_thresh(i) = ttt;
    ttime_peak(i) = ttp;
    peaks(i) = peak;
    title(sprintf("Hermd Taugahimnuspenna, R0=%.1e, b=%.5f", R_0, bspace(i)))
%     pause(0.2)
%     exportgraphics(gcf, "../Myndir/indep_b_" + i + ".pdf")

end
[mintime_peak, i] = min(ttime_peak(ttime_peak>0));
b_peak = bspace(i);
[mintime_thresh, i] = min(ttime_thresh);
b_thresh = bspace(i);
figure(3); clf; hold on
xlabel("b [cm]")
yyaxis left
plot(bspace, ttime_thresh)
plot(bspace, ttime_peak)
ylabel("Boðtími [s]")

yyaxis right
plot(bspace, peaks)
ylabel("Hæsta spenna í enda taugasímans [V]")

lgd = legend(["Boðtími þröskuldsspenna=0.025V", "Boðtími til hæstu spennu", "Hæsta spenna"]);
lgd.Location = "northwest";
% exportgraphics()
