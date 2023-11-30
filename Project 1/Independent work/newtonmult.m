function q=newtonmult(x0,tol) 
%skilgreina skal fallið F(x) og Jacobi fylki DF(x) sem function
%þ.e. fyrir utan þessu forriti
%hér er hugsað að x,x0 séu vigrar í R^n
q=x0;oldx=x0+2*tol;
while norm(q-oldx,inf)>tol
   oldx=q;
   s=-attemptDF(q)\attemptF(q); %part 10
   q=q+s;
end
end


%ath. að mögulega taka F og dF fleiri inntaksbreytur.

