function V = V0(t, t_rise, t_high, Vmax)
% t_rise = 0.001;
% t_high = 0.002;
% t = linspace(0, 0.01, 1000);
% Vmax = 0.05;
z = t_rise/2;
t2 = (2*t_rise + t_high)/2;
V = zeros(size(t));
% V((t_rise<t)&(t<=(t_rise + t_high))) = Vmax;
V(t<=t2) = Vmax./(1 + exp(-5*(t(t<=t2)-z)/z));
V((t2<t)) = Vmax - Vmax./(1 + exp(-5*(t((t2<t))-(z + (t_rise+t_high)))/z));

end
