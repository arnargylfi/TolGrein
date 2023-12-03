q0 = 10^(-4)*[2;4;3;4;5;4;3;2;3;4;0.01];
d = 2*10^(-3);
%t=0;
delta_p0 = 0.58;
D = [0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;d];
rho = 998;
mu = 1.002*10^(-3);
q_result = newtonmulti(q0,10^(-7),d,delta_p0);
Reynolds = (4*rho*q_result)./(mu*pi*D);
q_10=10^-3*[0.6578,0.3558,0.3035,0.3020,0.0523,0.2935,0.3020,0.3543,0.6478];%Viðbót úr dæmi 10 til samanburðar

pt1range=0.56:0.01:1;
pt0range=0.01:0.01:0.03;
qp1 = zeros(length(pt1range),11);  
qp0 = zeros(length(pt0range),11);  

q9t1 = 0;%zeros(length(p0range), 1);  
q9t0 = 0;%zeros(length(p0range), 1);  
q11=0
itert1=0;
itert0=0;

for i=1:length(pt1range)
    qp1(i,:) = newtonmulti(q0,10^(-4.5),d,pt1range(i));
    q9t1(i)=qp1(i,9) %Ná í dálk 9 vigurinn (fyrir allar raðir)
    q11(i)=qp1(i,11)
    itert1=iter+1;
end
Reynolds1 = (4*rho*q9t1)./(mu*pi*D)
q9t1
q11
for i=1:length(pt0range)
    qp0(i,:) = newtonmulti(q0,10^(-4.5),d,pt0range(i));
    q9t0(i)=qp0(i,9); %Ná í dálk 9 vigurinn (fyrir allar raðir)
    itert0=iter+1;
end
Reynolds0 = (4*rho*q9t0)./(mu*pi*D)
q9t0
q_result

figure
hold on;
yyaxis left;
plot(pt0range,q9t0,'b','LineWidth',1)%qp0)%
plot(pt1range,q9t1,'b','LineWidth',1)%qp1)%
scatter(0.5,q_10(9),'black','LineWidth',1)
%scatter(0.56,q_result(9),'blue')
ylabel('q9 flæði (m3/s)'); % Label for the y-axis
yyaxis right;
plot(pt0range,Reynolds0,'r-','LineWidth',1);
plot(pt1range,Reynolds1,'r--','LineWidth',1);
ylabel('Reynolds tala'); % Label for the y-axis
ylim([0 20000]);
%legend(legends); % Add the legend with the created entries
xlabel('delta_p'); % Label for the x-axis
title('q9 og Re sem fall af delta_p0'); % Title for the plot
legend('q9 flæði m.gati (lagstreymi)', 'q9 flæði m.gati (iðustreymi)', 'q9 flæði úr dæmi 10','Reynolds tala (q9 í lagstr.)', 'Reynolds tala (q9 í iðustr.)', 'Location', 'northwest');
hold off; % Release the plot hold


% Gerum stöplarit til að bera saman niðurstöðurnar úr dæmi 10 við þessar
figure
barplotdata = compare_in_bar_plot_extra(q_10, q_result);
bar(barplotdata)
title("Flæðissamanburður")
xlabel("Númer pípu")
ylabel("Flæði [m^3/s]")
legend({"Flæðigildi q gildi án gats (Dæmi 10)", "Flæðigildi q gildi með gati"}, 'Location', 'north')

