
m=100;
n=m;
d=2*10^-4; 
L=4*10^-2;
T=10^-2;
h=L/m;
k=T/n;
r_el=7*10^-4;

A=zeros(m+1,m+1);
b=zeros(m+1,1);
w=zeros(m+1,1);
W=zeros(m+1,m+1);   % Mesh (matrix) layerið til að plotta í 3D

al=d*k/h^2;
be=-2*d*k/h^2-k-1;

A(1,1)=1;
A(m+1,m+1)=1;

for i=2:m
       A(i,i-1)=1*al;
       A(i,i)=1*be;
       A(i,i+1)=1*al;
end

b(1)=0;    %Setjum vinstra jaðargildið í 0
b(m+1)=0;  %Setjum hægra jaðargildin í 0

for j=1:n
    for i=2:m
       if j==1
           if abs(i*h-L/2)<=r_el
               b(i)=-0.05;  % Upphafsgildi
           else
               b(i)=0;     % Upphafsgildi
           end
       end
       if j>1
           %b(1)=w(1)
           b(i)=-w(i);      % Upphafsgildin 
           %b(m+1)=w(m+1)
       end
    end
    % b(1)=0;    %Setjum vinstra jaðargildið í 0
    %b(m+1)=0;  %Setjum hægra jaðargildin í 0
    w=A'\b;
    W(:,j)=w
end

% Plotting the results
surf(W);
xlabel('Space');
ylabel('Time');
zlabel('Potential');
title('Cable Equation Solution');
