q = 10^(-4)*[2,4,3,4,5,4,3,2,3];

D = 0.2;
x = 2.5;
L = [5; x; 5-x; 1; 1; 1; x; 5-x; 5];
rho = 998;
delta_p0 = 0.5;
Qc = 10^(-5);


q7 = newtonmult(q,10^(-7));
[q10, darcydata] = newtonmult10(q,10^(-7)); % Darcydata fyrir plot neðar
Re = max((4*rho*q10)/(mu*pi*D));

% Teiknum stöplarit til að bera saman niðurstöður úr dæmi 7 á móti dæmi 10
barplotdata = compare_in_bar_plot(q7, q10);
bar(barplotdata)
title("Flæðissamanburður")
xlabel("Númer pípu")
ylabel("Flæði [m^3/s]")
legend({"Dæmi 7", "Dæmi 10"}, 'Location', 'north')

% teiknum stöplarit til að sýna núningsstuðul Darcy í hverri pípu með línu
% í því gildi sem við höfum verið að nota hingað til f = 0.02
figure(2)   % Nýr gluggi
pipes = 1:9;
gamla_f = repelem(f,9);
darcybarplotdata = compare_in_bar_plot(gamla_f, darcydata)
bar(darcybarplotdata);
%plot(pipes, gamla_f, pipes, darcydata);
title("Samanburður á núningsstuðul Darcy sem fasta og með líkani");
xlabel("Númer pípu");
ylabel("Núningsstuðull Darcy ")
legend({"f = 0.02", "f = {\alpha}Re^{\beta}"})
