T = 60;
n = 18000;
y_diff = 0.5;
s0 = 0.5;
theta0 = pi/3;
epsilon = 10^(-3);
w = RKsolver(s0,theta0,T,n,y_diff);
w2 = RKsolver(s0+epsilon,theta0+epsilon,T,n,y_diff);
plot(w(:,1),w(:,3))
hold on
plot (w2(:,1),w2(:,3))