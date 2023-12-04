function w=Eulersolver(s0,theta0,T,n) %might need more inputs later
%calculate initial position x0, y0 and step size h

L_eq = L0 + (m*g)/k;
x0 = (Leq+s0)*sin(theta0);
y0 = (Leq+s0)*cos(theta0);
w(1,:)=[x0,0,y0,0] %initial conditions
for i=1:n
     w(i+1,:)=w(i,:)+eulerstep(w(i,:),h);
end

