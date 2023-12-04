function w_next = RKstep(w,h, k, m, L0, g)
% Does 1 step in the Runge-Kutta method
    k1=derive_w(w, k, m, L0, g);
    k2=derive_w(w+h/2*k1, k, m, L0, g);
    k3=derive_w(w+h/2*k2, k, m, L0, g);
    k4=derive_w(w+h*k3, k, m, L0, g);
    
    w_next = w + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
end % Function

function w_derived=derive_w(w, k, m, L0, g)
L = sqrt(w(1)^2+w(3)^2);
%the differential system
w_derived(1)= w(2);
w_derived(2)= -(k/m)*(L-L0)*w(1)/L;
w_derived(3)= w(4);
w_derived(4)= -(k/m)*(L-L0)*w(3)/L-g;
end % Function
