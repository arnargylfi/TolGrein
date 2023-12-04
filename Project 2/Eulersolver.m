function w=Eulersolver(s0,theta0,T,n) %might need more inputs later
%calculate initial position x0, y0 and step size h
m = 0.2;
k = 2.5; %gormfasti
L0 = 1; %óteigð gormalengd
g = 9.81;
Leq = L0 + (m*g)/k;
x0 = (Leq+s0)*sin(theta0);
y0 = -(Leq+s0)*cos(theta0);
h = T/n;
w(1,:)=[x0,0,y0,0]; %initial conditions
for i=1:n
     w(i+1,:)=w(i,:)+eulerstep(w(i,:),h);
end
end


function z=eulerstep(w,h) %will eventually be replaced by RKstep(w,h)
z=h*system(w);
end
function z=system(w)
m = 0.2;
k = 2.5; %gormfasti
L0 = 1; %óteigð gormalengd
g = 9.81;
L = sqrt(w(1)^2+w(3)^2);
% the differential system
z(1)= w(2);
z(2)= -(k/m)*(L-L0)*w(1)/L;
z(3)= w(4);
z(4)= -(k/m)*(L-L0)*w(3)/L-g;
end  


