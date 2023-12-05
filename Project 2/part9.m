s0 = 0;
theta0 = pi/12;
n = 300;
epsilon = 10^(-3);
w = RKsolver(s0,theta0,10,n);
w2 = RKsolver(s0+epsilon,theta0+epsilon,10,n);
x = w(:,1); y = w(:,3);
x2 = w2(:,1); y2 = w2(:,3);

ball = animatedline('color','b','Marker','.','markersize',20);
ball2 = animatedline('color','g','Marker','.','markersize',20);
path = animatedline('Color','b','LineStyle','-'); % 'm' for magenta, you can choose any color
path2 = animatedline('Color','g','LineStyle','-'); % 'm' for magenta, you can choose any color
hLine = line([0, x(1)], [0, y(1)], 'Color', 'r'); %initialize línu frá (0,0) til fyrstu stöðu massans (gpt kóði smá skrýtið) 
h2Line = line([0, x2(1)], [0, y2(1)], 'Color', 'r'); %initialize línu frá (0,0) til fyrstu stöðu massans (gpt kóði smá skrýtið) 
for k = 1:n+1
    clearpoints(ball)
    clearpoints(ball2)
    addpoints(ball,x(k),y(k));
    addpoints(ball2,x2(k),y2(k));
    addpoints(path,x(k),y(k));
    addpoints(path2,x2(k),y2(k));
    set(hLine, 'XData', [0, x(k)], 'YData', [0, y(k)]); % updatea endapunkt línunnar alltaf 
    set(h2Line, 'XData', [0, x2(k)], 'YData', [0, y2(k)]); % updatea endapunkt línunnar alltaf 
    pause(0.1) %optional, changes speed
    drawnow %set to comment if only final picture is needed
end
