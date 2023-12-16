
% define the threshold voltage for other end
threshold = 0.025;

% construct the search space for b
Nb = 20;
bspace = linspace(-0.001, -0.03, Nb);
% define the volume of the dendrite
R_0 = 1e-7;
L = 0.04;
% find a according to equation (46), 
a = @(b) sqrt(2*R_0/(L - 2* b* tanh(L/(4*b))));

x = linspace(0, 0.04, 100);

% plot the shapes, d(x)
figure(4);clf;hold on
for i = 1:Nb
    plot(x, a(bspace(i))./(1 + exp(-(x-L/2)/bspace(i))))
end
xlabel("x[cm]")
ylabel("Þvermál griplunnar [cm]")

% calculate the transit times for each b
ttime_thresh = 0;
ttime_peak = 0;
peaks = 0;
for i = 1:Nb
    [ttt, ttp, peak] = transmit_time(a(bspace(i)), bspace(i), threshold);
    ttime_thresh(i) = ttt;
    ttime_peak(i) = ttp;
    peaks(i) = peak;
%     exportgraphics(gcf, "../Myndir/indep_b_" + bspace(i) + ".pdf")
end
figure(3); clf; hold on
xlabel("b [cm]")
yyaxis left
plot(bspace, ttime_thresh)
plot(bspace, ttime_peak)
ylabel("Boðtími [s]")

yyaxis right
plot(bspace, peaks)
ylabel("Hæsta spenna í enda griplu [V]")

lgd = legend(["Boðtími þröskuldsspenna=0.025V", "Boðtími til hæstu spennu", "Hæsta spenna"]);
lgd.Location = "northwest";
