
function r=r(x1,x2,t,d,L)

r=zeros(length(t),1);
for i=1:length(t)
    r(i)=d(i)-x1/(1+exp((t(i)-L/2)/x2));
end