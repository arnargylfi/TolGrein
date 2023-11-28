q = 10^(-4)*[2,4,3,4,5,4,3,2,3];
D = 0.2;
x = 2.5;
L = [5; x; 5-x; 1; 1; 1; x; 5-x; 5];
rho = 998;
delta_p0 = 0.5;
Qc = 10^(-5);
f = 0.02;

q = newtonmult(q,10^(-7)) %ATHUGA FARA í NEWTONMULT.M OG COMMENTA ÚT Part10 og COMMENTA INN PART 7!!!
% Re = max((4*rho*q)/(mu*pi*D))