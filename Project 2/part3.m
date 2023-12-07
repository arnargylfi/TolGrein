close all % Loka öllum myndagluggum
s0 = 0;
theta0 = pi/12;
n = 300;
T = 10;
w = Eulersolver(s0,theta0,T,n);
x = w(:,1); y = w(:,3);

ball = animatedline('color','b','Marker','.','markersize',100);
trajectory = animatedline('color','r','LineWidth',2)%,'markersize',2);
spring = animatedline('Color','k','LineWidth',2)
L=sqrt(x_T.^2+y_T.^2); %calculates length of spring at all time steps
    
set(gcf,'FontSize',15); % Fontsize

xlabel("x [m]");
ylabel("y [m]");
title("Hreyfimynd pendúls hermd með Eulersolver.m");


for k = 1:n+1
    clearpoints(ball)
    addpoints(ball,x_T(k),y_T(k));
    addpoints(trajectory,x_T(k),y_T(k));
    %Spring
    clearpoints(spring)
    omega=12*pi/L(k); %12 controls the number of coils
    xx=linspace(0,L(k),200);
    yy=0.1*sin(omega*xx); %plot(xx,yy) draws a spring pointing to the right. The
    % string is stretched or compressed according to the length L(k)

    theta=atan2(y_T(k),x_T(k)); %rotating angle is arctan(y/x)
    xp = xx*cos(theta)-yy*sin(theta); %multiply (xx,yy) by a rotation matrix
    yp = xx*sin(theta)+yy*cos(theta); %xx as a vector connects (0,0) to the
    %position of the string. yy is the coily plot in the direction of xx.

    addpoints(spring,xp,yp)
    pause(0.01) %optional, changes speed
    drawnow %set to comment if only final picture is needed
end % For


% Gamla hreyfimyndin
% ball = animatedline('color','b','Marker','.','markersize',20);
% path = animatedline('Color','m','LineStyle','-'); % 'm' for magenta, you can choose any color
% hLine = line([0, x(1)], [0, y(1)], 'Color', 'r'); %initialize línu frá (0,0) til fyrstu stöðu massans (gpt kóði smá skrýtið) 
% Stilla textastærð
% for k = 1:n+1
%     addpoints(path,x(k),y(k));
%     clearpoints(ball)
%     addpoints(ball,x(k),y(k));
%     set(hLine, 'XData', [0, x(k)], 'YData', [0, y(k)]); % updatea endapunkt línunnar alltaf 
%     pause(0.1) %optional, changes speed
%     drawnow %set to comment if only final picture is needed
% end

% Vista mynd
exportgraphics(gcf,'myndir/part3.pdf');