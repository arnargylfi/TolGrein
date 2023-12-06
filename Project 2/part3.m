s0 = 0;
theta0 = pi/12;
n = 300;
T = 10;
w = Eulersolver(s0,theta0,T,n);
x = w(:,1); y = w(:,3);

ball = animatedline('color','b','Marker','.','markersize',20);
path = animatedline('Color','m','LineStyle','-'); % 'm' for magenta, you can choose any color
hLine = line([0, x(1)], [0, y(1)], 'Color', 'r'); %initialize línu frá (0,0) til fyrstu stöðu massans (gpt kóði smá skrýtið) 
% Stilla textastærð
set(gca,'FontSize',15);

text(x(1),y(1)+0.03,"t = 0 sek", 'fontsize', 14);
text(x(n+1),y(n+1)-0.1,"t = " + T + " sek", 'fontsize', 14);
xlabel("x [m]");
ylabel("y [m]");
title("Hreyfimynd pendúls hermd með Eulersolver.m");
for k = 1:n+1
    addpoints(path,x(k),y(k));
    clearpoints(ball)
    addpoints(ball,x(k),y(k));
    set(hLine, 'XData', [0, x(k)], 'YData', [0, y(k)]); % updatea endapunkt línunnar alltaf 
    pause(0.1) %optional, changes speed
    drawnow %set to comment if only final picture is needed
end
