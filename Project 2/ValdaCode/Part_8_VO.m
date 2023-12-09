SpringP7m=0.2;
L0=1;
k=2.5;
g=9.81;
Leq=L0+m*g/k;
%s0=-L0;
s0=[L0,L0,2*L0,3*L0,-L0,-2*L0,-2*L0,-3*L0]; %Upphafsgildin, 8 talsins
s0_string={'L0','L0','2*L0','3*L0','-L0','-2*L0','-2*L0','-3*L0'};
theta0=[pi*3/4,pi/3,pi/2,pi,pi,pi*2/3,pi/36,pi/2];  %Upphafsgildin, 8 talsins
theta0_string={'\pi', '\pi/3', '\pi/2', '\pi', '\pi', '2\pi/3', '\pi/36', '\pi/2'};
T=40;
n=10;
format long

Nu=8;   % Number of times we double the value (iterations)
E_f=zeros(1,length(Nu));    %Initialize the E_f final value vector for Y-axis (plot)
Ef_matrix=NaN(length(s0),length(Nu)); %Array to store each E_f vector
N=0;    % Total value of n inside the for-loop
N_vector=zeros(1,length(Nu));
N_matrix=NaN(length(s0),length(Nu));    %Array to store each N_vector
%iter=0
for j=1:length(s0)
%    iter=iter+1
for i=1:Nu
N=(2^(i-1))*n*T;
N_vector(i)=N;  % Concat the N value for the X-axis (plot)
w=EulersolverRK(s0(j),theta0(j),T,N);

x_T=w(:,1);
vx_T=w(:,2);
y_T=w(:,3);
vy_T=w(:,4);

L=sqrt(x_T.^2+y_T.^2); %calculates length of spring at all time steps

% Calculate initial energy
U_initial = m * g * y_T(1);
K_initial = 0.5 * m * (vx_T(1)^2 + vy_T(1)^2);
W_initial = 0.5 * k * (L0 - L(1))^2;
E_initial = U_initial + K_initial + W_initial;

%Calculate the energy values
U=m*g*y_T;
K=0.5*m*(vx_T.^2+vy_T.^2);
W=0.5*k*(L0-L).^2;
E=U+K+W;

%Error=abs(E-E_initial);
E_final=E(N);
%E_f(i)=Error(N+1)% Add the error value to the E_f vector for y-axis
E_f(i)=abs(E_final-E_initial)% Add the error value to the E_f vector for y-axis 
end
Ef_matrix(:,j)=E_f;
N_matrix(:,j)=N_vector;
end

for i = 1:length(s0)
% Calculate the slope of the line in the log-log plot
p = polyfit(log(N_matrix(:,i)), log(Ef_matrix(:,i)), 1); % p(1) contains the slope
% Plot the data
subplot(4,2,i);
loglog(N_matrix(:,i), Ef_matrix(:,i), 'o-');
% Hold the current plot
hold on;
% Plot the line of best fit
loglog(N_matrix(:,i), exp(polyval(p, log(N_matrix(:,i)))), '-');
xlabel('Skrefafjöldi n');
ylabel('Orkutap/Skekkja Error');
legend('Error(n)', ['Besta lína (halli: ', num2str(p(1)), ')']);
title(['Orkutap vs skrefafjöldi. Log-skali. (s_0: ', s0_string{i}, ' and \theta_0:',theta0_string{i}, ')'], 'Interpreter', 'tex');
grid on;
disp(['The slope of the line is: ', num2str(p(1))]);
hold off;
end
exportgraphics(gcf,'C:/Users/valdi/OneDrive/Documents/MATLAB/Lota2/part8_1.pdf');

