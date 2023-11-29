function min_approx=goldensearch(a,b,tol)
    phi=(sqrt(5)-1)/2;
    x1=a+(1-phi)*(b-a);
    x2=a+phi*(b-a);
    f1=f9(x1);f2=f9(x2);
    while (b-a)/2>tol
        if f1<f2
            b=x2; x2=x1; x1=a+(1-phi)*(b-a);
            f2=f1; f1=f9(x1);
        else
            a=x1; x1=x2; x2=a+phi*(b-a);
            f1=f2; f2=f9(x2);
        end
    end
    min_approx=(a+b)/2;
end