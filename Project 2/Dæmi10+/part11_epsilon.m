T = 120;
n = 18000;
%y_diff = 0.1;
y_diff = 0;
%s0 = 0.5;
s0 = 0;
theta0 = pi/12;
%theta0 = pi/3;
theta0_string={'\pi/3','\pi/12'};
epsilon = 10^(-3):10^(-3):0.05;
threshold = 5*10^(-2); %threshold bil milli pendúa sem við metum sem augljóst
tc_list = zeros(length(epsilon),1); %initializa lista fyrir tc
for i = 1:length(epsilon)
      w = RKsolver(s0,theta0,T,n,y_diff);
      w2 = RKsolver(s0+epsilon(i),theta0+epsilon(i),T,n,y_diff);
      skekkjur = sqrt((w2(:,1)-w(:,1)).^2+(w2(:,3)-w(:,3)).^2);
      index_geq_threshold = find(skekkjur>=threshold); %Skilar indexi fyrir allar skekkjur yfir threshold, tek svo fyrsta stak af þessu array
      if isempty(index_geq_threshold) %ef hámarkskekkjan fer aldrei yfir threshold
          tc = T; %set tc = T
      else
          tc = index_geq_threshold(1) * T/n; %Skilar tc ef tc er til
      end
      tc_list(i) = tc;
      i
end % for
plot(epsilon(1:25),tc_list(1:25)); % Plottum upp sirka hálfan tc ferilinn vegna þess að hann nær núlli fljótt.
%xlabel("\epsilon [m]", "Interpreter", "tex")
%ylabel("t_c [s]", "Interpreter", "tex")
xlabel('\epsilon [m]');
ylabel('t_c [s]');
title('Tími t_c sem fall af upphafsstöðumun \epsilon.','FontSize',12);
textString1 = "y'(0) = " + y_diff;
textString2 = "s_0 = " + s0;
textString3 = "theta_0 = " + theta0_string(2);
%text(1, -1, textString, 'FontSize', 12);
fig = gcf;
text('Units', 'normalized', 'Position', [0.72 0.88], 'String', 'Upphafsskilyrði:', 'FontSize', 10);
text('Units', 'normalized', 'Position', [0.75 0.8], 'String', textString1, 'FontSize', 10);
text('Units', 'normalized', 'Position', [0.75 0.72], 'String', textString2, 'FontSize', 10);
text('Units', 'normalized', 'Position', [0.75 0.64], 'String', textString3, 'FontSize', 10);
grid on;
exportgraphics(gcf,'C:/Users/valdi/OneDrive/Documents/MATLAB/Lota2/part11_epsilon_s0_0.pdf');
