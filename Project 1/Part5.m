Y = zeros(9,length(T_2));
Reynolds = Y;
for k = 1:length(T_2)
    [q,Re] = q_Re_mu(mu_2(k));
    Y(:,k) = q;
    Reynolds(:,k) = Re;
end
figure(1)
plot(T_2,Y)
legend('q1','q2','q3','q4','q5','q6','q7','q8','q9')
xlabel('T [C°]')
ylabel('flowrate [m^3/s]')


figure(2)
plot(T_2,Reynolds)
xlabel('T [C°]')
ylabel('Reynolds')
legend('Re1','Re2','Re3','Re4','Re5','Re6','Re7','Re8','Re9')
yline(2000,'red')
