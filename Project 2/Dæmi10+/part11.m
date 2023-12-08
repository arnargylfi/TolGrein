T = 30;
n = 18000;
y_diff = 0.1;
s0 = 0.5;
theta0 = pi/3;
epsilon = 10^(-3):10^(-3):0.1;
threshold = 2*10^(-2);
tc_list = zeros(length(epsilon)); %initializa lista fyrir tc
for i = 1:length(epsilon)
      w = RKsolver(s0,theta0,T,n,y_diff);
      w2 = RKsolver(s0+epsilon(i),theta0+epsilon(i),T,n,y_diff);
      skekkjur = sqrt((w2(:,1)-w(:,1)).^2+(w2(:,3)-w(:,3)).^2);
      index_geq_threshold = find(skekkjur>=threshold); %Skilar indexi fyrir allar skekkjur yfir threshold, tek svo fyrsta stak af þessu array
      tc = index_geq_threshold(1) * T/n; %Skilar tc
      tc_list(i) = tc;
      i
end % for
plot(epsilon,tc_list);
xlabel("$\epsilon$", "Interpreter", "tex")
ylabel("$t_c$", "Interpreter", "tex")

