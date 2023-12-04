s0 = 0;
theta0 = pi/12;
n = 300;
w = Eulersolver(s0,theta0,10,n);
x = w(:,1); y = w(:,3);


ball = animatedline('color','b','Marker','.','markersize',20);
for k = 1:n+1
    clearpoints(ball)
    addpoints(ball,x(k),y(k));
    pause(0.1) %optional, changes speed
    line([0, x(k)], [0, y(k)], 'Color', 'r'); % Draw line in red for contrast
    drawnow %set to comment if only final picture is needed
end