function w=RKsolver(w0, k, m, L0, T, n) %might need more inputs later
%calculate initial position x0, y0 and step size h
%L0 = 1;     % óteygð gormalengd
g = 9.81;   % Þyngdarhröðun
t = 0;      % Upphafstími
h = T/n;
w(1,:)=w0; %initial conditions
for i=1:n
    t=t+h;
    w(i+1,:) = RKstep(w(i,:), h, k, m, L0, g);
    if w(i+1, 1) > 1000 || w(i+1, 3)> 1000
        w(i+1:n, :) = 1000;
        break
    end
end % For
end % Function