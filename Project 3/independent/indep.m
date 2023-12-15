function [W, x, t] = indep(T,m,n, t_rise, t_high, Vmax, a, b)
if nargin == 0
    T = 0.3;m=100;n=100; t_rise=0.05; t_high=0.01; Vmax=0.05;
    a = 0.0049466;
    b = -0.00573094;
end
disp([T,m,n, t_rise, t_high, Vmax, a, b])
cm = 1;
L = 0.04*cm;  % 0.04 cm
h = L/m;
k = T/n;

% Gerum x og t vigra
x = 0:h:L;
t = 0:k:T;

% Reiknum vinstra jaðarskilyrðið
V0t = V0(t, t_rise, t_high, Vmax);

% Reiknaum d(x) og d'(x)
dx = a./(1 + exp(-(x-L/2)/b));
dddx = gradient(dx)./gradient(x);


gammax = -k*dx/h^2;
sigmax = 2*k*dddx/h;
alphax = gammax + sigmax;
betax = 1 + k - 2*gammax - sigmax;

A = sparse(m+1,m+1);
% vinstri skálína
A(2:2+m:(m+1)^2) = alphax(1:(end-1));
% miðju skálína
A(1:2+m:(m+1)^2) = betax;
% hægri skálína
A((m+2):2+m:(m+1)^2) = gammax(2:end);
% full(A)
% spy(A)

% laga efstu og neðstu línuna 
A(1, 1:3) = [1, 0, 0];
A(end, end-2:end) = [-1, 4, -3];

% Upphafsskilyrðin eru
b0 = zeros(m+1, 1);

% W er fylki af w_{i,j}
W = zeros(m+1, n+1);

%  fyrsti dálkur er b0
W(:, 1) = b0;

% Næstu dálkar eru reiknaðir útfrá dálknum á undan
for j = 1:n
    % Jaðarskilyrðin eru:
    W(1, j) = V0t(j);
    geyma = W(end,j);
    W(end, j) = 0;
    
    % reiknum næsta dálk
    W(:,j+1) = A\W(:,j);

    W(end, j) = geyma;
%     if mod(j,100) == 0
%         j
%     end
end

% mesh(x, t, W')
% xlabel("x")
% ylabel("t")
% if nargin == 0
%     W = max(W(:, end))
% end



