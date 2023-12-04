function w=RKsolver(s0,theta0,T,n) %might need more inputs later
%calculate initial position x0, y0 and step size h
m = 0.2;    % Massi
k = 2.5;    %gormfasti
L0 = 1;     % óteygð gormalengd
g = 9.81;   % Þyngdarhröðun
t = 0;      % Upphafstími
Leq = L0 + (m*g)/k;
x0 = (Leq+s0)*sin(theta0);
y0 = -(Leq+s0)*cos(theta0);
h = T/n;    
w(1,:)=[x0,0,y0,0]; %initial conditions

for i=1:n
    t=t+h;
    w(i+1,:) = RKstep(w(i,:), h, k, m, L0, g);
end % For
end % Function