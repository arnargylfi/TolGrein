function [W, x, t] = D7(T,m,n)
% function D7(T, m, n)
if nargin == 0
    T = 0.01;m=100;n=100;
end
cm = 1;
L = 0.04*cm;  % 0.04 cm
d = 0.0002*cm; %0.0002 cm
relec = 0.0007*cm; % 0.0008 cm
V_0 = 0.05; % 0.05 V
h = L/m;
k = T/n;

% Gerum x og t vigra
x = 0:h:L;
t = 0:k:T;

% Reikna A:   -0.00573094
a = 0.0049466;
b = -0.00573094;
ispace = 1:(m+1);
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
full(A);
% spy(A)

% laga efstu og neðstu línuna 
A(1, 1:3) = [1, 0, 0];
A(end, end-2:end) = [0, 0, 1];
%Reikna b:

%logical array með þeim x sem eru stærra en L/2-relec og minna en L/2+relec
sirka_midja = (x>=L/2-relec) & (x<=L/2+relec); 
%margfalda það með 0.05 V fyrir b vigur í j=0 😎
b0 = sirka_midja'*V_0;

% W er fylki af w_{i,j}. Er í raun W(x,t) nema við setjum inn stikann fyrir
% x og t en ekki gildið sjálft
W = zeros(m+1, n+1);

%  fyrsti dálkur er b0
W(:, 1) = b0;

% Næstu dálkar eru reiknaðir útfrá dálknum á undan
for j = 1:n
    % Jaðarskilyrðin eru W(1,j)
    W(1, j) = 0;
    W(end, j) = 0;
    W(:,j+1) = A\W(:,j);
    if mod(j,100) == 0
        j
    end
end
% if nargin == 0
%     W = max(W(:, end))
% end



