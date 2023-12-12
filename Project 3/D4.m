function w = D4(T,m,n)
L = 0.04*10^-2;
h = L/m;
k = T/n;
d = 0.0002*10^-2;
beta = d*k/(h^2);
relec = 0.0008*10^-2; 
% Reikna A: 
A = diag((2*beta+k+1)*ones(1,m+1)) +... %Miðju hornalína
    diag(-beta*ones(1,m),1)+... %hægri/uppi hornalína
    diag(-beta*ones(1,n),-1); % vinstri/niðri hornalína
A(1,1) = 1;A(m+1,m+1)=1; %hægrast efst og vinstrast neðst overwrita í 1
%Reikna b:
%Geri vigurinn x
x = 0:h:L;
%logical array með þeim x sem eru stærra en L/2-relec og minna en L/2+relec
sirka_midja = (x>=L/2-relec) & (x<=L/2+relec); 
%margfalda það með 0.05 V fyrir b vigur 😎
b = sirka_midja*0.05;
b = b';
w = A\b;



