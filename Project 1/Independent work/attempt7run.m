q0 = 10^(-4)*[2;4;3;4;5;4;3;2;3];
q  = newtonmult(q0,10^(-7))
rho = 998;
delta_p0 = 0.5;
Qc = 10^(-5);
f = 0.02;
mu = 1.002*10^(-3);
Re = (4*rho*q)./(mu*pi*0.2)
