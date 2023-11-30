q = 10^(-4)*[2,4,3,4,5,4,3,2,3];

D = 0.2;
x = 2.5;
L = [5; x; 5-x; 1; 1; 1; x; 5-x; 5];
rho = 998;
delta_p0 = 0.5;
Qc = 10^(-5);
f = 0.02;

x = 0.1:0.1:4.9;
Q = [];
for k = 1:length(x)
    Q(k,:) = newtonmult8(q,10^(-7),x(k));
end
plot(x,Q,"linewidth",1.5)   
colororder(["yellow","red","green","blue","black","#800080","#964B00","#FFB6C1","#FFA500"])
legend("q1","q2","q3","q4","q5","q6","q7","q8","q9")
xlabel("x (m)")
ylabel("Flæði [m^3/s]")
