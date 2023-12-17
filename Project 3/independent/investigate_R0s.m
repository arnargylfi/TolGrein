
NR0 = 20;
R0s = logspace(-7, -5.5, NR0);
mps = 0;mts = 0;bps=0;bts=0;
for i = 1:NR0
    [mp, mt, bp, bt] = investigate_bs(R0s(i));
    mps(i)=mp;mts(i)=mt;bps(i)=bp;bts(i)=bt;
end

figure(5);clf;
loglog(R0s, mintimes)
xlabel("R0 [cm^3]")
ylabel("Bestaður boðtími [s]")
exportgraphics(gcf, "../Myndir/indeploglogR0.pdf")