T = 1000;
%n = T:500:150*T;
n = T:100:5*T;
%y_diff = 1;
%y_diff = 0;
y_diff=[0,2,4]
%s0 = 2;
%s0 = 0;
s0=[0,0.5,1]; %Upphafsgildin, 8 talsins
s0_string={'0','0.5m','1m'};
%theta0 = pi/12;
%theta0 = pi/3;
theta0=[pi/12,pi/3,pi*2/3];  %Upphafsgildin, 3 talsins
theta0_string={'\pi/12','\pi/3','2\pi/3'};
epsilon = 10^(-3);
threshold = 1*10^(-2); %threshold bil milli pendúa sem við metum sem augljóst
tc_list = zeros(length(n),1); %initializa lista fyrir tc
%tc_list = zeros(1,length(n)); %initializa lista fyrir tc
%Tc_matrix=NaN(length(n),9); %Fylki til að geyma alla tc_vigra (3 dálkar vegna fjölda upphafssbreytna: s0,theta0 og y'0)
Tc_matrix=[]
for k=1:3
    for j=1:3   % Fyrir hvert upphafsskilyrði s0 eða theta0 eða ydiff
        for i = 1:length(n)
            if (k==1) %Run j s0 values with all others at first value  
              w = RKsolver(s0(j),theta0(1),T,n(i),y_diff(1));
              w2 = RKsolver(s0(j)+epsilon,theta0(1)+epsilon,T,n(i),y_diff(1));
            end
            if k==2 %Run j theta0 values with all others at first value
              w = RKsolver(s0(1),theta0(j),T,n(i),y_diff(1));
              w2 = RKsolver(s0(1)+epsilon,theta0(j)+epsilon,T,n(i),y_diff(1));
            end
            if k==3 %Run j y_diff values with all others at first value
              w = RKsolver(s0(1),theta0(1),T,n(i),y_diff(j));
              w2 = RKsolver(s0(1)+epsilon,theta0(1)+epsilon,T,n(i),y_diff(j)); 
            end
              skekkjur = sqrt((w2(:,1)-w(:,1)).^2+(w2(:,3)-w(:,3)).^2);
              index_geq_threshold = find(skekkjur>=threshold); %Skilar indexi fyrir allar skekkjur yfir threshold, tek svo fyrsta stak af þessu array
              if isempty(index_geq_threshold) %ef hámarkskekkjan fer aldrei yfir threshold
                  tc = T; %set tc = T
              else
                  tc = index_geq_threshold(1) * T/n(i); %Skilar tc ef tc er til
              end
              tc_list(i) = tc;
              i
        end % for
        %Tc_matrix(j,:)=tc_list;
        Tc_matrix=[Tc_matrix,tc_list];
    end
end

length(Tc_matrix)
size(Tc_matrix,1)
size(Tc_matrix,2)
length(n)
length(Tc_matrix)

for l=1:9
    if l<4
    plot(n,Tc_matrix(:,l),"LineStyle","-","LineWidth",0.5);
    end
    if (3<l)&&(l<7)
    plot(n,Tc_matrix(:,l),"LineStyle","--","LineWidth",1);
    end
    if (6<l)
    plot(n,Tc_matrix(:,l),"LineStyle","-.","LineWidth",1.5);
    end
    hold on;
end

xlabel('n');
ylabel('t_c [s]');
title('Tími t_c sem fall af skefafjölda n.','FontSize',12);
legend('s0=0','s0=0.5','s0=1','\theta_0=\pi/12','\theta_0=\pi/3','\theta_0=2\pi/3','y(0)=0','y(0)=2','y(0)=4');
grid on;
% textString1 = "y'(0) = " + y_diff;
% textString2 = "s_0 = " + s0;
% textString3 = "theta_0 = " + theta0_string(1);
% 
% fig = gcf;
% text('Units', 'normalized', 'Position', [0.72 0.88], 'String', 'Upphafsskilyrði:', 'FontSize', 10);
% text('Units', 'normalized', 'Position', [0.75 0.8], 'String', textString1, 'FontSize', 10);
% text('Units', 'normalized', 'Position', [0.75 0.72], 'String', textString2, 'FontSize', 10);
% text('Units', 'normalized', 'Position', [0.75 0.64], 'String', textString3, 'FontSize', 10);
%exportgraphics(gcf,'C:/Users/valdi/OneDrive/Documents/MATLAB/Lota2/part11_epsilon_s0_0.pdf');
