s0 = 0.5;
theta0 = pi/3;
n = 1800;
epsilon = 10^(-3);
T = 60;
w = RKsolver(s0,theta0,T,n);
w2 = RKsolver(s0+epsilon,theta0+epsilon,T,n);
x = w(:,1); y = w(:,3);
x2 = w2(:,1); y2 = w2(:,3);

ball = animatedline('color','b','Marker','.','markersize',20);
ball2 = animatedline('color','g','Marker','.','markersize',20);
path = animatedline('Color','k','LineStyle','-'); % 'k' for black, you can choose any color
path2 = animatedline('Color','c','LineStyle','-'); % 'c' for cyan, you can choose any color
hLine = line([0, x(1)], [0, y(1)], 'Color', 'r'); %initialize línu frá (0,0) til fyrstu stöðu massans (gpt kóði smá skrýtið) 
h2Line = line([0, x2(1)], [0, y2(1)], 'Color', 'r'); %initialize línu frá (0,0) til fyrstu stöðu massans (gpt kóði smá skrýtið) 
%plot(w(1,1),w(1,3), 'b<', 'MarkerSize', 10, 'MarkerFaceColor', 'g');   % Upphafspunktur
% text(w(1,1),w(1,3)+0.03,"t = 0", 'fontsize', 14);

hold on;
plot(w(n+1,1),w(n+1,3),'bsquare', 'MarkerSize', 5, 'MarkerFaceColor', 'k');   % endapunktur1
plot(w2(n+1,1),w2(n+1,3),'bsquare', 'MarkerSize', 5, 'MarkerFaceColor', 'r');   % endapunktur2

title('Spor tveggja pendúla með misteygða upphafsstöðu gorms (s0 vs s0+epsilon)','fontsize',10);
ylabel('Y-axis [m]'); % Label for the y-axis
xlabel('X-axis [m]'); % Label for the x-axis
%xloc = 0.7; yloc = 0.3; width = 0.1; height = 0.1;
legend('','','Pend. 1 (s0=0.5m)','Pend. 2 (s0=0.5+0.001m)','','','t=T (Pend.1)', 't=T (Pend.2)', 'Location', 'northeast');%[xloc yloc width height]);


for k = 1:n+1
    clearpoints(ball)
    clearpoints(ball2)
    addpoints(ball,x(k),y(k));
    addpoints(ball2,x2(k),y2(k));
    addpoints(path,x(k),y(k));
    addpoints(path2,x2(k),y2(k));
    set(hLine, 'XData', [0, x(k)], 'YData', [0, y(k)]); % updatea endapunkt línunnar alltaf 
    set(h2Line, 'XData', [0, x2(k)], 'YData', [0, y2(k)]); % updatea endapunkt línunnar alltaf 
    drawnow %set to comment if only final picture is needed
end
hold off;
exportgraphics(gcf,'Myndir/Dæmi 9/part9_Trajectory.pdf');

