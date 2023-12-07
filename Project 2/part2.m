close all % Loka öllum gröfum

s0 = 0;
theta0 = pi/12;
T = 10;
n = 300;
w = Eulersolver(s0,theta0,T,n);

x_T=w(:,1),vx_T=w(:,2),y_T=w(:,3),vy_T=w(:,4)

animate_yay_or_nay = false;

if animate_yay_or_nay
    ball = animatedline('color','b','Marker','.','markersize',100);
    trajectory = animatedline('color','r','LineWidth',2)%,'markersize',2);
    spring = animatedline('Color','k','LineWidth',2)
    L=sqrt(x_T.^2+y_T.^2); %calculates length of spring at all time steps
    
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
end % if

figure(2)
plot(w(:,1),w(:,3))
xlabel('x [m]')
ylabel('y [m]')
title("Pendúll dæmi 2, T = " + T + " sek");
% Bæta við upphafspunkti og endapunkti ferils
hold on
%plot(w(1,1),w(1,3),'r*');   % Upphafspunktur
%text(w(1,1),w(1,3)+0.03,"t = 0 sek", 'fontsize', 14);

%plot(w(n+1,1),w(n+1,3),'r*');   % Endapunktur
%text(w(n+1,1),w(n+1,3)+0.03,"t = " + T + " sek", 'fontsize', 14);

plot(w(1,1),w(1,3), 'b<', 'MarkerSize', 10, 'MarkerFaceColor', 'g');   % Upphafspunktur
% text(w(1,1),w(1,3)+0.03,"t = 0", 'fontsize', 14);

plot(w(n+1,1),w(n+1,3),'bsquare', 'MarkerSize', 10, 'MarkerFaceColor', 'r');   % Upphafspunktur
% text(w(n+1,1),w(n+1,3)+0.03,"t = " + T + " sek", 'fontsize', 14);
xloc = 0.75; yloc=0.67; width=0.1;height=0.1;
legend('', 't = 0sek', 't = T','Position', [xloc yloc width height]);% [0.75 0.67 0.1 0.1]);% 'Location', 'bestoutside');

% Hlutfallslega jafn stórir ásar
daspect([1 1 1])
% Stilla textastærð
%set(gca,'FontSize',15)
hold off

% Vista mynd
exportgraphics(gca,'myndir/part2.pdf');