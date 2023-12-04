function z=eulerstep(w,h) %will eventually be replaced by RKstep(w,h)
z=h*system(w);
end
function z=system(w)
%the differential system
z(1)= w(2);
z(2)= -(k/m)*(L-L0)*w(1)/L;
z(3)= w(4);
z(4)= -(k/m)*(L-L0)*w(3)/L-g;
end  
