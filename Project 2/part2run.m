s0 = 0;
theta0 = pi/12;
w = Eulersolver(s0,theta0,10,300)
plot(w(:,1),w(:,3))
xlabel('x [m]')
ylabel('y [m]')