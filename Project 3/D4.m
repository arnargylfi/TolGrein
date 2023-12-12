function [W, x, t] = D4(T,m,n)
L = 0.04*10^-2;  % [m] 0.04 cm
d = 0.0002*10^-2; % [m] 0.0002 cm
relec = 0.0007*10^-2; % [m] 0.0007 cm
V_0 = 0.05; % 0.05 V
h = L/m;
k = T/n;
beta = -d*k/(h^2);
alpha = 1 + k - 2*beta;
% Reikna A: 
A = sparse(m+1,m+1);
A(1:2+m:(m+1)^2) = alpha;
A(m+2:2+m:(m+1)^2) = beta;
A(2:2+m:(m+1)^2) = beta;
spy(A)

% laga efstu og neðstu línuna 
A(1, 1:2) = [1, 0];
A(end, end-1:end) = [0, 1];
%Reikna b:
%Geri vigurinn x
x = 0:h:L;
t = 0:k:T;
%logical array með þeim x sem eru stærra en L/2-relec og minna en L/2+relec
sirka_midja = (x>=L/2-relec) & (x<=L/2+relec); 
%margfalda það með 0.05 V fyrir b vigur í j=0 😎
b0 = sirka_midja'*V_0;

% W er fylki af w_{i,j}
W = zeros(m+1, n+1);

%  fyrsti dálkur er b0
W(:, 1) = b0;

% Næstu dálkar eru reiknaðir útfrá dálknum á undan
for j = 1:n
    % Jaðarskilyrðin eru W(1,j)
    W(1, j) = 0;
    W(end, j) = 0;
    W(:,j+1) = A\W(:,j);
    % Skrifa út hver 100 skref svo við sjáum árangurinn
    if mod(j,100) == 0
        j
    end

end





