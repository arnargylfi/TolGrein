function y4 = D4_lausn(x)
%Gefin lausn fyrir dæmi 4
C1 = 0.36788;
C2 = -0.5;
n = size(x,2);
y4 = zeros(1,n);
for i = 1:n
    y4(i) = y_almennt(x(i),C1,C2);
end % for
end