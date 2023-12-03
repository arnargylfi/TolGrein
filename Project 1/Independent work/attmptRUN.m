q0 = 10^(-4)*[2;4;3;4;5;4;3;2;3;4;0.01];
d = 2*10^(-3);
%t=0;
%delta_p0 = 0.01;
D = [0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;d];
rho = 998;
mu = 1.002*10^(-3);
%q_result = newtonmulti(q0,10^(-4.5),d,delta_p0)

pt1range=0.56:0.01:1;
pt0range=0.01:0.01:0.03;
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


q9t2 = 0;
tol2=10^-9;
bestq9=0;
bestp=0;
z=0;
w_iter=0;
f_iter=0;

while bestq9==0;
    w_iter=w_iter+1
    z=z-1
    pt2range=0.47:0.01*10^z:0.56;
    qp2 = zeros(length(pt2range),11);
    q9t2 = 0;
    for i=1:length(pt2range)
    qp2(i,:) = newtonm(q0,10^(-7),d,pt2range(i),1);
    q9t2(i)=qp2(i,9); %Ná í dálk 9 vigurinn (fyrir allar raðir)
    f_iter=f_iter+1
    if abs(q_10(9)-q9t2(i))<tol2;
        bestq9=q9t2(i)
        bestp=pt2range(i) 
    end
    end
end
q_10(9) %Original q9 value from example 10
bestq9  %Best approximation of the new q9 (compared to q_10(9))
bestp   %The delta_p0 at the best approximation
w_iter   %Number of while loop iterations
f_iter  %Number of for loop iterations
qp3 = newtonm(q0,10^(-7),d,0.5,1);
qp3(9)  %Value of q9 flow at delta_p0=0.5


figure
hold on;
yyaxis left;
plot(pt0range,q9t0,'b','LineWidth',1)%qp0)%
plot(pt1range,q9t1,'b','LineWidth',1)%qp1)%
%plot()
scatter(0.5,q_10(9),'black','LineWidth',1)
ylabel('q9 flæði (m3/s)'); % Label for the y-axis
yyaxis right;
plot(pt0range,Reynolds0,'r-','LineWidth',1);
plot(pt1range,Reynolds1,'r--','LineWidth',1);
ylabel('Reynolds tala'); % Label for the y-axis
ylim([0 20000]);
%legend(legends); % Add the legend with the created entries
xlabel('delta_p'); % Label for the x-axis
title('q9 og Re sem fall af delta_p0'); % Title for the plot
legend('q9 flæði m.gati (lagstreymi)', 'q9 flæði m.gati (iðustreymi)', 'q9 flæði án gats (Dæmi 10)','Reynolds tala (q9 í lagstr.)', 'Reynolds tala (q9 í iðustr.)', 'Location', 'northwest');
hold off; % Release the plot hold