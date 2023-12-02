function [x, f] =newtonmult10(x0,tol) 
%skilgreina skal fallið F(x) og Jacobi fylki DF(x) sem function
%þ.e. fyrir utan þessu forriti
%hér er hugsað að x,x0 séu vigrar í R^n
x=x0';oldx=x0+2*tol;
while norm(x-oldx,inf)>tol
   oldx=x;
   [jacobian, f] = DFP10(x);
s=-jacobian\FP10(x); %part 10
   x=x+s;
end
end


%ath. að mögulega taka F og dF fleiri inntaksbreytur.