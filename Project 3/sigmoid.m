function d = sigmoid(x,L,a,b)
%Skilar þvermáli taugafrumu fyrir gefið x (staða á frumu, vigur), L (lengd taugafrumu), a og b, í [m]
% Allar lengdir þurfa að vera í sömu einingu.
d = zeros(1, max(size(x)));
for i = 1:max(size(x))
    d(i) = a/(1+exp((x(i)-L/2)/b));
end % for
end % Function