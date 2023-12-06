T = 60;
n = 18000;
y_diff = 0:0.1:10;
s0 = 0.5;
theta0 = pi/3;
epsilon = 10^(-3);
for i = 1:length(y_diff)
    clf;
    w = RKsolver(s0,theta0,T,n,y_diff(i));
    w2 = RKsolver(s0+epsilon,theta0+epsilon,T,n,y_diff(i));
    subplot(1,2,1)
    plot(w(:,1),w(:,3))
    title('asdæij')
    xlabel('x')
    ylabel('y')
    subplot(1,2,2)
    plot (w2(:,1),w2(:,3))
    title('asijd')
    sgtitle('Gröf')
    pause(0.1);
end % for
