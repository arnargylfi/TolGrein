function q = q_delta_p(delta_p0)
%Skilar flowrate og tekur delta_p0 sem breytu
Qc = 10^(-5);
mu = 1.002*10^(-3);
D = 0.2;
x = 2.5;
L = [5; x; 5-x; 1; 1; 1; x; 5-x; 5];
A = [1,-1,0,-1,0,0,0,0,0;
     0,1,-1,0,-1,0,0,0,0;
     0,0,1,0,0,-1,0,0,0;
     0,0,0,1,0,0,-1,0,0;
     0,0,0,0,1,0,1,-1,0;
     0,0,0,0,0,1,0,1,-1;
     0,L(2),0,-L(4),L(5),0,-L(7),0,0;
     0,0,L(3),0,-L(5),L(6),0,-L(8),0;
     (128*mu)/(pi*D^4)*[L(1),0,0,L(4),0,0,L(7),L(8),L(9)]];
b = [0;0;Qc;0;0;0;0;0;delta_p0];
q = A\b;