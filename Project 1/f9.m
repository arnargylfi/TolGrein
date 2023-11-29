function q5 = f9(x)
q = 10^(-4)*[2,4,3,4,5,4,3,2,3];
Q = newtonmult8(q,10^(-7),x);
q5 = Q(5);