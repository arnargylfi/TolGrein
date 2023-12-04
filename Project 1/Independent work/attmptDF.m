function DFattempt = attmptDF(q,d,t) %t bætt við
% d = 2*10^(-3);
D = [0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;0.2;d];
x = 2.5; 
L = [5; x/2; 5-x; 1; 1; 1; x; 5-x; 5;x/2;0.02];
rho = 998;
mu = 1.002*10^(-3);
alpha = 0.3164;
beta = -0.25;
Re = (4*rho*q)./(mu*pi*D);
f = alpha*Re.^beta; %Darcy friction coefficient. 
%turbulent = Re>= 2000; %Skilar logical array þar sem 1 er allstaðar þar sem það er turbulent 
turbulent = t>= 1; %Skilar logical array þar sem 1 er allstaðar þar sem það er turbulent 
laminar = ~turbulent; %skilar öfugu logical array.
%Reikna núna seinustu jöfnurnar, þar sem þær eru þær einu sem eru
%breytilegar eftir iðu/lag

%STUÐLAR FYRIR SEINUSTU 4 JÖFNUR Í HNEPPI:
studla_matrix = [0,0,L(3),0,-L(5),L(6),0,-L(8),0,0,0;
0,L(2),0,-L(4),L(5),0,-L(7),0,0,L(10),0;
L(1),0,0,L(4),0,0,L(7),L(8),L(9),0,0;
L(1),L(2),0,0,0,0,0,0,0,0,L(11)];

%TURBULENT STUÐULL FYRIR SEINUSTU TVÆR JÖFNUR:
turb_const = 8*f*rho./(pi^2*D.^5);
%LAMINAR STUÐLAR FYRIR SEINUSTU TVÆR JÖFNUR
lam_const = 128*mu./(pi^2*D.^4);
%MARGFALDA ÞESSA STUÐLA VIÐ TURBULENT OG LAMINAR LOGICAL ARRAYIÐ SVO ÞEIR

%MUNU BARA MARGFALDAST VIÐ VIÐEIGANDI FLÆÐI OG VIÐEIGANDI q^2 eða q^1 !!!
studlar = 2*turb_const.*turbulent.*q+lam_const.*laminar; %2* turbulence fastinn * q þar sem það er iðustreymi og laminar fastinn *1 þar sem það er lagstreymi

%HEILDAR JÖFNU HNEPPI

DFattempt = [1,-1,0,-1,0,0,0,0,0,0,0;
    0,1,0,0,0,0,0,0,0,-1,-1;
    0,0,-1,0,-1,0,0,0,0,1,0;
    0,0,1,0,0,-1,0,0,0,0,0;
    0,0,0,1,0,0,-1,0,0,0,0;
    0,0,0,0,1,0,1,-1,0,0,0;
    0,0,0,0,0,1,0,1,-1,0,0;
    studla_matrix(1,:).*studlar';
    studla_matrix(2,:).*studlar';
    studla_matrix(3,:).*studlar';
    studla_matrix(4,:).*studlar';];