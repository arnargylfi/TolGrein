format long
T0 = 273.16; %Fasti
%Gögn: 
T = [20,40,60,80,100]';
mu = 10^(-3)*[1.003, 0.657, 0.467, 0.355, 0.283]';
%Linearization
ln_mu = log(mu);

%Stilli upp stuðla fylki sem á að margfaldast við [a,b,c] og jafngilda ln(mu) 

A = [ones(length(T),1),1./(T+T0),1./(T+T0).^2];
b = ln_mu;

%RMSQ aðferð:

x = (A'*A)\A'*b;
scatter(T',mu','filled')
hold on
T_2 = 20:1:100;
T_2 = T_2';
A_2 = [ones(length(T_2),1),1./(T_2+T0),1./(T_2+T0).^2];
mu_2 = exp(A_2*x);
plot(T_2,mu_2);

RMSE = sum((exp(A*x)-mu).^2*1)/length(A);




