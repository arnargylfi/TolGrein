function y2 = D2_lausn(x)
%Gefin lausn fyrir dæmi 2
C1 = 0.96334;
C2 = 1.0367;
n = size(x,2);
y2 = zeros(1,n);
for i = 1:n
    y2(i) = y_almennt(x(i),C1,C2);
end % for
end