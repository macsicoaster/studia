clear all %#ok
close all
clc

wart_pocz = [-5 5 25];
zakres = [0 5];
[t, wartosci_ukladu] = ode23(@ukladlorenza, zakres, wart_pocz);

liczba_n_h1 = 20;
liczba_n_h2 = 20;
liczba_n_o = 1;


function y = ukladlorenza(t,f); %#ok
    s = 10;
    r = 28;
    b = 3;
    y = [s*f(2) - s*f(1); r*f(1) - f(1) - f(1)*f(3) - f(2); f(1)*f(2) - b*f(3)];
end
x = wartosci_ukladu(:,1);
y = wartosci_ukladu(:,2);
z = wartosci_ukladu(:,3);
figure(1)
grid on;
hold on;
box on;
plot(x);
title('wartosc x');

figure(2)
grid on;
hold on;
box on;
plot(y);
title('wartosc y');

figure(3)
grid on;
hold on;
box on;
plot(z);
title('wartosc z');

figure(4)
grid on;
hold on;
box on;
plot3(wartosci_ukladu(:,1), wartosci_ukladu(:,2), wartosci_ukladu(:,3));
title('wartosci x, y, z');

siec = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o ],{'tansig', 'tansig', 'purelin'},'trainlm');
siec.trainParam.epochs = 1000;
siec.trainParam.goal = 1e-7;

in_data_train = [t(1:length(t)-2), t(2:length(t)-1), t(3:length(t))];
out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu)-2,1)];

siec = train(siec,in_data_train',out_data_train');

%in_data_test = [x(3:length(x)) y(3:length(y)) z(3:length(z))];
%out_data_test = [wartosci_ukladu(3:length(wartosci_ukladu),1)];

%% wyznaczamy x
wynik_x = sim(siec,in_data_train');
figure(5)
grid on;
hold on;
box on;
plot(out_data_train,'m');
plot(wynik_x');
legend('training data','output data')
title('x wyzanaczone przez siec')

%% wyznaczyć y
out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu)-2,2)];
siec = train(siec,in_data_train',out_data_train');
wynik_y = sim(siec,in_data_train');
figure(6)
grid on;
hold on;
box on;
plot(out_data_train,'m');
plot(wynik_y');
legend('training data','output data')
title('y wyznaczone przez siec')

out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu)-2,3)];
siec = train(siec,in_data_train',out_data_train');
wynik_z = sim(siec,in_data_train');

figure(7)
grid on;
hold on;
box on;
plot(out_data_train,'m');
plot(wynik_z');
legend('train data', 'output data')
title('z wyznaczone przez siec')

figure(9)
grid on;
hold on;
box on;
plot3(wynik_x', wynik_y', wynik_z');
title('x, y, z wyznaczone przez siec')
plot3(wartosci_ukladu(1:length(wartosci_ukladu)-2,1), wartosci_ukladu(1:length(wartosci_ukladu)-2,2), wartosci_ukladu(1:length(wartosci_ukladu)-2,3));
legend('output data', 'training data')


%% wyznaczyć x, y, z
liczba_n_o2 = 3;
siec2 = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o2 ],{'tansig', 'tansig', 'purelin'},'trainlm');
siec2.trainParam.epochs = 1000;
siec2.trainParam.goal = 1e-7;
out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu)-2,1), wartosci_ukladu(1:length(wartosci_ukladu)-2,2), wartosci_ukladu(1:length(wartosci_ukladu)-2,3)];
siec2 = train(siec2,in_data_train',out_data_train');
wynikxyz = sim(siec2,in_data_train');

figure(8)
grid on;
hold on;
box on;
plot3(out_data_train(:,1), out_data_train(:,2), out_data_train(:,3));
plot3(wynikxyz(1,:), wynikxyz(2,:), wynikxyz(3,:));
legend('training data','output data');
title('x, y, z wyznaczone przez jedną sieć');