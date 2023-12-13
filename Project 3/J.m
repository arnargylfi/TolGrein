
function J=J(x1,x2,t,L)
J=zeros(length(t),2);
for k=1:length(t)
    J(k,1)=-1/(1+exp((t(k)-L/2)/x2));
    J(k, 2) = x1*(L-2*t(k))*exp((L+2*t(k))/(2*x2))/(2*x2^2*(exp(L/(2*x2))+exp(t(k)/x2))^2);
end
