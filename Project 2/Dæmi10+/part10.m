T = 60;
n = 18000;
y_diff = 0:0.05:10;
s0 = 0.5;
theta0 = pi/3;
epsilon = 10^(-3);
maxskekkjur = zeros(length(y_diff),1);
for i = 1:length(y_diff)
    clf;
    w = RKsolver(s0,theta0,T,n,y_diff(i));
    w2 = RKsolver(s0+epsilon,theta0+epsilon,T,n,y_diff(i));
    subplot(1,2,1)
    plot(w(:,1),w(:,3))
    title("Án \epsilon", "interpreter" , "tex");
    xlabel('x')
    ylabel('y')
    subplot(1,2,2)
    plot (w2(:,1),w2(:,3),'m')
    title("Með \epsilon", "interpreter" , "tex");
    skekkjur = sqrt((w2(:,1)-w(:,1)).^2+(w2(:,3)-w(:,3)).^2);
    maxskekkjur(i) = max(skekkjur);
    sgtitle("y'(0) = " + y_diff(i)+" Hámarks bil milli ferla = "+ max(skekkjur))
    pause(0);
end % for
figure(2)
plot(y_diff,maxskekkjur)
xlabel("y'(0)")
ylabel('Hámarks bil milli tveggja ferla')

