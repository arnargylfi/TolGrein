function q=newtonmult(x0,tol,d,delta_p0) 
%skilgreina skal fallið F(x) og Jacobi fylki DF(x) sem function
%þ.e. fyrir utan þessu forriti
%hér er hugsað að x,x0 séu vigrar í R^n
q=x0;oldx=x0+2*tol;
while norm(q-oldx,inf)>tol
   oldx=q;
   s=-IndependentDF(q,d)\independentF(q,d,delta_p0); %part 10
   q=q+s;
end
end


%ath. að mögulega taka F og dF fleirix inntaksbreytur.

