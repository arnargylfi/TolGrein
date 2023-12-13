
function J=J(x1,x2,t,L)
J=zeros(length(t),2);
for k=1:length(t)
    J(k,1)=-1/(1+exp((t(k)-L/2)/x2));
    %J(k,2)=(x1*(exp((t(k)-L/2)/x2))*((t(k)-L/2)/x2^2))/(1+exp((t(k)-L/2)/x2))^2;
    J(k,2)=x1*((t(k)-L/2)/x2^2)/(1+exp((t(k)-L/2)/x2));
end
