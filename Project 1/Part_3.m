x = 0.01:0.01:0.11;
y= [];
for k = 1:length(x)
    y(:,k)= q_delta_p(x(k));
end
plot(x,y)
legend('q1','q2','q3','q4','q5','q6','q7','q8','q9')
xlabel('delta p_0 [Pa]')
ylabel('flowrate q [m^3/s]')