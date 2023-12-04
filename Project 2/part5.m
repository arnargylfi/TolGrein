m = 0.2;    % Massi
k = 2.5;    %gormfasti
L0 = 1;     % óteygð gormalengd
g = 9.81;   % Þyngdarhröðun

s0 = 0;
theta0 = pi/12;
n = 300;
T = 40;
w = RKsolver(s0,theta0,T,n);
x = w(:,1); dx = w(:,2); y = w(:,3); dy = w(:,4);
U = -m*g*y;
K = m*(x.^2+y.^2)/2;%Samkvæmt verkefnalýsingu, en er þetta rétt? Giska að rétt er fyrir neðan
% K = m*(dx.^2+y.^2)/2
W = -k*(L0-sqrt(x.^2+y.^2));

Etotal = U+K+W;

Leq = L0 + (m*g)/k;
x0 = (Leq+s0)*sin(theta0);
y0 = -(Leq+s0)*cos(theta0);
Einitial = -m*g*y0+k*(L0-sqrt(x0^2+y0^2))^2/2;

Energy_error = abs(Einitial-Etotal);
t = 0:40/300:40;
plot(t,[Etotal,U,K,W,Energy_error])
yline(Einitial,'Label','Upphafsorka')
legend('Heildarorka','Stöðuorka','Hreyfiorka','Fjaðurorka','Skekkja')