function y = y_almennt(x,C1, C2)
%Almenn lausn á diffurjöfnunni okkar
y = C1*exp(x) + C2*exp(-x);
y = y';
end