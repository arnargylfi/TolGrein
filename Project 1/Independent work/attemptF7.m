function Fattempt7 = attemptF7(q)
% q = 10^(-4)*[2;4;3;4;5;4;3;2;3];
D = 0.2;
x = 2.5;  
L = [5; x; 5-x; 1; 1; 1; x; 5-x; 5];
rho = 998;
delta_p0 = 0.1;
Qc = 10^(-5);
f = 0.02;
mu = 1.002*10^(-3);
Re = (4*rho*q)./(mu*pi*D);
turbulent = Re>= 2000; %Skilar logical array þar sem 1 er allstaðar þar sem það er turbulent 
laminar = ~turbulent; %skilar öfugu logical array.
%Reikna núna seinustu jöfnurnar, þar sem þær eru þær einu sem eru
%breytilegar eftir iðu/lag

%STUÐLAR FYRIR SEINUSTU 3 JÖFNUR Í HNEPPI:
studla_matrix = [0,0,L(3),0,-L(5),L(6),0,-L(8),0;
0,L(2),0,-L(4),L(5),0,-L(7),0,0;
L(1),0,0,L(4),0,0,L(7),L(8),L(9)];

%TURBULENT STUÐULL FYRIR SEINUSTU TVÆR JÖFNUR:
turb_const = 8*f*rho./(pi^2*D.^5);
%LAMINAR STUÐLAR FYRIR SEINUSTU TVÆR JÖFNUR
lam_const = 128*mu./(pi^2*D.^4);
%MARGFALDA ÞESSA STUÐLA VIÐ TURBULENT OG LAMINAR LOGICAL ARRAYIÐ SVO ÞEIR
%MUNU BARA MARGFALDAST VIÐ VIÐEIGANDI FLÆÐI OG VIÐEIGANDI q^2 eða q^1 !!!
studlar = turb_const.*turbulent.*q.^2+lam_const.*laminar.*q;
%MARGFALDA NÚNA MEÐ FYLKINU 
eqs8_11 = studla_matrix*studlar;
%HEILDAR JÖFNU HNEPPI
Fattempt7 = [q(1)-q(2)-q(4);
    q(2)-q(3)-q(5);
    q(3)-q(6)-Qc;
    q(4)-q(7);
    q(5)+q(7)-q(8);
    q(6)+q(8)-q(9);
    eqs8_11(1);
    eqs8_11(2)-delta_p0;
    eqs8_11(3)-delta_p0];
