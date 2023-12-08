T = 120;
n = T:500:150*T;
y_diff = 0;
% s0 = 0.5;
s0 = 0;
theta0 = pi/12;
% theta0 = pi/3;
epsilon = 10^(-3);
threshold = 5*10^(-2); %threshold fyrir hvenær við segjum að þetta er óreglulegt eða eitthvað
tc_list = zeros(length(n),1); %initializa lista fyrir tc
for i = 1:length(n)
      w = RKsolver(s0,theta0,T,n(i),y_diff);
      w2 = RKsolver(s0+epsilon,theta0+epsilon,T,n(i),y_diff);
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
plot(n,tc_list);
xlabel("n", "Interpreter", "tex")
ylabel("t_c [s]", "Interpreter", "tex")

