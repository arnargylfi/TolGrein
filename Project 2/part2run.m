m = 0.2;
k = 2.5; %gormfasti
L0 = 1; %óteigð gormalengd
g = 9.81;
xy = [4;3]; %x(t), y(t)
L = norm(xy); %lengd gorms (sqrt(x^2+y^2))
deltaL = L-L0; %teiging á gorm
n = (1/L)*xy;  %Einhver fasti sem er reiknaður til að reikna kraftinn að neðan
F = -k*deltaL*n; %kraftur 

