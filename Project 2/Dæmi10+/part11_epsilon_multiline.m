T = 100;
%n = T:500:150*T;
n = 12000;
y_diff=[0,2,4]
s0=[0,0.5,1]; %Upphafsgildin, 8 talsins
s0_string={'0','0.5m','1m'};
theta0=[pi/12,pi/3,pi*2/3];  %Upphafsgildin, 3 talsins
theta0_string={'\pi/12','\pi/3','2\pi/3'};
epsilon = 10^(-3):10^(-3):0.03;
threshold = 5*10^(-2); %threshold bil milli pendúa sem við metum sem augljóst
tc_list = zeros(length(n),1); %initializa lista fyrir tc
%Tc_matrix=[]
Tc_matrix = zeros(length(epsilon), 9); % Initialize Tc_matrix with correct dimensions
for k=1:3
    for j=1:3   % Fyrir hvert upphafsskilyrði s0 eða theta0 eða ydiff
        for i = 1:length(epsilon)
            if k==1 %Run j s0 values with all others at first value  
              w = RKsolver(s0(j),theta0(1),T,n,y_diff(1));
              w2 = RKsolver(s0(j)+epsilon(i),theta0(1)+epsilon(i),T,n,y_diff(1));
            end
            if k==2 %Run j theta0 values with all others at first value
              w = RKsolver(s0(1),theta0(j),T,n,y_diff(1));
              w2 = RKsolver(s0(1)+epsilon(i),theta0(j)+epsilon(i),T,n,y_diff(1));
            end
            if k==3 %Run j y_diff values with all others at first value
              w = RKsolver(s0(1),theta0(1),T,n,y_diff(j));
              w2 = RKsolver(s0(1)+epsilon(i),theta0(1)+epsilon(i),T,n,y_diff(j)); 
            end
              skekkjur = sqrt((w2(:,1)-w(:,1)).^2+(w2(:,3)-w(:,3)).^2);
              index_geq_threshold = find(skekkjur>=threshold); %Skilar indexi fyrir allar skekkjur yfir threshold, tek svo fyrsta stak af þessu array
              if isempty(index_geq_threshold) %ef hámarkskekkjan fer aldrei yfir threshold
                  tc = T; %set tc = T
              else
                  tc = index_geq_threshold(1) * T/n; %Skilar tc ef tc er til
              end
              tc_list(i) = tc;
              i
        end
        %Tc_matrix=[Tc_matrix,tc_list];
        Tc_matrix(:, (k-1)*3 + j) = tc_list;
    end
end
length(Tc_matrix)
size(Tc_matrix,1)
size(Tc_matrix,2)
length(epsilon)
Tc_matrix(:,5)

for l=1:9
    if l<4
    plot(epsilon,Tc_matrix(:,l),"LineStyle","-","LineWidth",0.5);
    end
    if (3<l)&&(l<7)
    plot(epsilon,Tc_matrix(:,l),"LineStyle","--","LineWidth",1);
    end
    if (6<l)
    plot(epsilon,Tc_matrix(:,l),"LineStyle","-.","LineWidth",1.5);
    end
    hold on;
end
% epsilon_min = min(epsilon);
% epsilon_max = max(epsilon);
% tc_min = min(Tc_matrix(:)); % Get the minimum tc value from all columns
% tc_max = max(Tc_matrix(:)); % Get the maximum tc value from all columns
% % Now set the axis limits
% xlim([epsilon_min epsilon_max]);
% ylim([tc_min tc_max]);
xlabel('\epsilon [m]');
ylabel('t_c [s]');
title('Tími t_c sem fall af upphafsbili \epsilon.','FontSize',12);
legend('s0=0','s0=0.5','s0=1','\theta_0=\pi/12','\theta_0=\pi/3','\theta_0=2\pi/3',"y'(0)=0","y'(0)=2","y'(0)=4");
grid on;
exportgraphics(gcf,'C:/Users/valdi/OneDrive/Documents/MATLAB/Lota2/part11_tc_vs_epsilon_multiline2.pdf');
