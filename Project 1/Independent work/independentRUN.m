format long
q0 = 10^(-4)*[2;4;3;4;5;4;3;2;3;4;0.01];
d = 2*10^(-3);

D = [0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;d];
rho = 998;
mu = 1.002*10^(-3);
delta_p0 = 0.58;
newtonmult(q0,10^(-7),d,delta_p0)
% delta_p0 = 0.578:0.1:1.5;
% for k = 1:length(delta_p0)
%     q_result= newtonmult(q0,10^(-7),d,delta_p0(k));    
%     Qa(k,:) = q_result;
%     Re_vector(k,:) = (4*rho*q_result)./(mu*pi*D);
% end
% plot(delta_p0,Re_vector,'linewidth',1.5)
% legend('Re1','Re2','Re3','Re4','Re5','Re6','Re7','Re8','Re9','Re10','Re11')
% xlabel('delta_p0 [Pa]')
% ylabel('Reynolds talan')
% colororder(["yellow","red","green","blue","black","#800080","#964B00","#FFB6C1","#FFA500","#00FFFF","#043420"])
