function x=newtonmult(x0,tol) 
%skilgreina skal fallið F(x) og Jacobi fylki DF(x) sem function
%þ.e. fyrir utan þessu forriti
%hér er hugsað að x,x0 séu vigrar í R^n
x=x0';oldx=x0+2*tol;
while norm(x-oldx,inf)>tol
   oldx=x;
%    s=-DFP7(x)\FP7(x); %Part 7
s=-DFP10(x)\FP10(x); %part 10
   x=x+s;
end
end


%ath. að mögulega taka F og dF fleiri inntaksbreytur.

