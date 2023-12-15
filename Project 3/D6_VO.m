%Part 6
clear % Til öryggis ef einhver er t.d. með breytu sem heitir 'r' og reynir að kalla á fallið r.m #LentiÍÞvíOgÞaðSökkar
L=0.04*10^(-2); % [m]
t=[0,0.01*10^(-2),0.02*10^(-2),0.03*10^(-2),0.04*10^(-2)];  % [m] Þetta eru x gildin
d=(10^-6)*[4.8,4.3,2.3,0.8,0.2];    % [m] gefin gildi

close all
format long

iter=0;
tol=10^-8;
x1=2*10^-5; %initial values for a
x2=2*10^-4; %initial values for b
x=[x1,x2]'; %Fylki sem inniheldur x1 og x2 og notum í ítrunarloopunni
x_old=[0,0];
x1_old=0;   % Til að geyma gamla x1 eftir ítrun og bera saman
x2_old=0;   % Til að geyma gamla x2 eftir ítrun og bera saman
delta_x=[0,0];      % Gildi sem við reiknum út með least square method
a=[];%zeros(1955,1);    % Til að plotta upp a í lokin
b=[];%zeros(1955,1);    % Til að plotta upp b í lokin
noorm=[];%zeros(1955,1)   % Til að plotta upp norm í lokin

for i=1:1000
%while norm(x-x_old,inf)>tol
    iter=iter+1;
    J1=J(x1,x2,t,L);
    r1=r(x1,x2,t,d,L);
    delta_x=(J1'*J1)\(J1'*r1);  %Þetta er LSME (Least Square Method) eða aðferð minnstu fern.
    x_old=x;
    x=x-delta_x;
    x1=x(1);
    x2=x(2);
    noorm(i) = max(abs(x_old-x));
    a(i)=x1;    % Hleð inn x1 gildum í a
    b(i)=x2;    % Hleð inn x2 gildum í b
    if norm(x_old-x,inf)<tol
        break
    end % if
end % for

% Disp a og b
disp("a: " + a(iter) + " m");
disp("b: " + b(iter) + " m");

figure(1)
plot(a)
title('a')
figure(2)
plot(b)
title('b')
figure(3)
plot(log(noorm))
title('norm')
figure(4)
plot(t,r(x1,x2,t,d,L))



t2 = 0:L/50:L;

figure(5)
clf
hold on
plot(t,d,"*r")
for i = 1:length(a)
    plot(t2,a(i)./(1+exp((t2-L/2)/b(i))))
end
colororder(["#FFA500","red","green","blue","black","m"])
legend("Mæligildi","Ítrun 1","Ítrun 2","Ítrun 3","Ítrun 4","Ítrun 5","Ítrun 6")
xlabel("x [m]")
ylabel("d [m]")
exportgraphics(gcf, "Myndir/D6.pdf")

