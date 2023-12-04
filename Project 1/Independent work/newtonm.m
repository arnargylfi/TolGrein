function q=newtonm(x0,tol,d,delta_p0,t) 
%skilgreina skal fallið F(x) og Jacobi fylki DF(x) sem function
%þ.e. fyrir utan þessu forriti
%hér er hugsað að x,x0 séu vigrar í R^n
q=x0;oldx=x0+2*tol;
while norm(q-oldx,inf)>tol
   oldx=q;
   s=-attmptDF(q,d,t)\attmptF(q,d,delta_p0,t); %part 10
   q=q+s;
end
end


%ath. að mögulega taka F og dF fleiri inntaksbreytur.