T = 60;
n = 18000;
y_diff = 0:0.05:10;
% y_diff = 0:10;
s0 = 0.5;
theta0 = pi/3;
epsilon = 10^(-3);
maxskekkjur = zeros(length(y_diff),1);
for i = 1:length(y_diff)
    clf;
    hold on
    w = RKsolver(s0,theta0,T,n,y_diff(i));
    w2 = RKsolver(s0+epsilon,theta0+epsilon,T,n,y_diff(i));
%     subplot(1,2,1)
%     title("Án \epsilon", "interpreter" , "tex");
    plot(w(:,1),w(:,3))
    xlabel('x[m]')
    ylabel('y[m]')
%     subplot(1,2,2)
%     title("Með \epsilon", "interpreter" , "tex");
    plot (w2(:,1),w2(:,3),'m')
    skekkjur = sqrt((w2(:,1)-w(:,1)).^2+(w2(:,3)-w(:,3)).^2);
    maxskekkjur(i) = max(skekkjur);
    sgtitle("y'(0) = " + y_diff(i)+" Hámarks frávik milli ferla = "+ max(skekkjur))
    pause(0);
%     if mod(y_diff(i), 1) == 0
%         exportgraphics(gcf, sprintf("../myndir/Dæmi 10/dy%i.pdf", y_diff(i)))
%     end
end % for
figure(2)
plot(y_diff,maxskekkjur)
xlabel("y'(0) [m/s]")
ylabel('Hámaksskekkja [m]')
title("Hámarksskekkja milli ferlanna sem fall af y'(0)")
exportgraphics(gcf, "../myndir/Dæmi 10/dæmi10.pdf")
