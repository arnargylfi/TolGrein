function y3 = D3_lausn(x)
%Gefin lausn fyrir dæmi 3
C1 = -1.0074;
C2 = -2.0074;
n = size(x,2);
y3 = zeros(1,n);
for i = 1:n
    y3(i) = y_almennt(x(i),C1,C2);
end % for
end