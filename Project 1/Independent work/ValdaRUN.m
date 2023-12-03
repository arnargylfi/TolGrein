q0 = 10^(-4)*[2;4;3;4;5;4;3;2;3;4;0.01];
d = 2*10^(-3);
%t=0;
%delta_p0 = 0.01;
D = [0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;d];
rho = 998;
mu = 1.002*10^(-3);
%q_result = newtonmulti(q0,10^(-4.5),d,delta_p0)

pt1range=0.56:0.01:1;
pt0range=0.01:0.01:0.033;
qp1 = zeros(length(pt1range),11);  
qp0 = zeros(length(pt0range),11);  

q9t1 = 0;%zeros(length(p0range), 1);  
q9t0 = 0;%zeros(length(p0range), 1);  
itert1=0;
itert0=0;

for i=1:length(pt1range)
    qp1(i,:) = newtonm(q0,10^(-4.5),d,pt1range(i),1);
    q9t1(i)=qp1(i,9) %Ná í dálk 9 vigurinn (fyrir allar raðir)
    itert1=iter+1;
end
Reynolds1 = (4*rho*q9t1)./(mu*pi*D)
q9t1
for i=1:length(pt0range)
    qp0(i,:) = newtonm(q0,10^(-4.5),d,pt0range(i),0);
    q9t0(i)=qp0(i,9); %Ná í dálk 9 vigurinn (fyrir allar raðir)
    itert0=iter+1;
end
Reynolds0 = (4*rho*q9t0)./(mu*pi*D)
q9t0

figure
hold on;
yyaxis left;
p1=plot(pt0range,q9t0,'b')%qp0)%
p2=plot(pt1range,q9t1,'b')%qp1)%
ylabel('q9 flowrate'); % Label for the y-axis
yyaxis right;
p3=plot(pt0range,Reynolds0,'r');
p4=plot(pt1range,Reynolds1,'r');
ylabel('Reynolds number'); % Label for the y-axis
ylim([0 20000]);
%legend(legends); % Add the legend with the created entries
xlabel('delta_p'); % Label for the x-axis
title('Plot of q9 and Re vs delta_p0'); % Title for the plot
legend('q9 flowrate (pt0)', 'q9 flowrate (pt1)', 'Reynolds number (pt0)', 'Reynolds number (pt1)', 'Location', 'northwest');
hold off; % Release the plot hold