function F10 = FP10(q) 


D = 0.2;
x = 2.5; 
L = [5; x; 5-x; 1; 1; 1; x; 5-x; 5];
rho = 998;
delta_p0 = 0.5;
Qc = 10^(-5);
mu = 1.002*10^(-3);
alpha = 0.3164;
beta = -0.25;
Re = (4*rho*q)/(mu*pi*D);
f = alpha*Re.^beta;

F10 = [q(1)-q(2)-q(4);
    q(2)-q(3)-q(5);
    q(3)-q(6)-Qc;
    q(4)-q(7);
    q(5)+q(7)-q(8);
    q(6)+q(8)-q(9);
    L(2)*q(2)^2-L(4)*q(4)^2+L(5)*q(5)^2-L(7)*q(7)^2;
    L(3)*q(3)^2-L(5)*q(5)^2+L(6)*q(6)^2-L(8)*q(8)^2;
    (8*rho)/(pi^2*D^5)*(f(1)*L(1)*q(1)^2+f(4)*L(4)*q(4)^2+f(7)*L(7)*q(7)^2+f(8)*L(8)*q(8)^2+f(9)*L(9)*q(9)^2)-delta_p0];
