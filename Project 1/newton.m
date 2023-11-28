function x=newton(x0,tol)
%skilgreina hér fallið f(x)
%f=@(x) ...
%og f'(x)
%Df=@(x) ...
x=x0;oldx=x-100;
while abs(x-oldx)>tol
   oldx=x;
   x=x-f(x)/Df(x); 
end
end