clear all %#ok
close all
clc
% wyznaczamy parametry układu równań na podstawie jego rozwiązania
wart_pocz = [-5 5 25];
zakres = [0 5];
[t, wartosci_ukladu] = ode23(@ukladlorenza, zakres, wart_pocz);



function y = ukladlorenza(t,f); %#ok
    s = 10;
    r = 28;
    b = 8/3;
    y = [s*f(2) - s*f(1); r*f(1) - f(1) - f(1)*f(3) - f(2); f(1)*f(2) - b*f(3)];
end
x = wartosci_ukladu(:,1);
y = wartosci_ukladu(:,2);
z = wartosci_ukladu(:,3);

figure(1)
subplot(1,3,1);grid;box;hold;
plot(x);
title('x value');
subplot(1,3,2);grid;box;hold;
plot(y);
title('y value');

subplot(1,3,3);grid;box;hold;
plot(z);
title('z value');

figure(2)
grid on;
hold on;
box on;
plot3(wartosci_ukladu(:,1), wartosci_ukladu(:,2), wartosci_ukladu(:,3));
title('values: x, y, z');

test_data = t + (randn(size(t))*0.05);

% parametry sieci
MN = 50; 
DF = 5; 
GOAL = 0; 
SPREAD = 0.5; % spłaszczenie rozkładu normalnego
in_data_train = [t(1:length(t)-2), t(2:length(t)-1), t(3:length(t))];
in_data_test = [test_data(1:length(test_data)-2), t(2:length(test_data)-1), t(3:length(test_data))];




out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu)-2,1), wartosci_ukladu(1:length(wartosci_ukladu)-2,2), wartosci_ukladu(1:length(wartosci_ukladu)-2,3)];
siec2 = newrb(in_data_train,out_data_train,GOAL,SPREAD,MN,DF);
wynikxyz = sim(siec2,in_data_train);
wyniki_test = sim(siec2,in_data_test);

figure(5)
subplot(1,2,1)
grid on;
hold on;
box on;
plot3(out_data_train(:,1), out_data_train(:,2), out_data_train(:,3));
plot3(wynikxyz(1,:), wynikxyz(2,:), wynikxyz(3,:));
legend('training data','output data');
title('x, y, z wyznaczone z danych treningowych metodą newrb');

subplot(1,2,2);grid;box;hold;
plot3(out_data_train(:,1), out_data_train(:,2), out_data_train(:,3));
plot3(wyniki_test(1,:), wyniki_test(2,:), wyniki_test(3,:));
legend('training data','output data');
title('x, y, z wyzanczone z danych testowych metodą newrb ')

tr_mse_ff = mse(out_data_train,wynikxyz);
test_mse_ff = mse(out_data_train,wyniki_test);
figure(6);
subplot(1,3,1);grid;box;hold;
plot(x);
plot(y);
plot(z);
legend('x','y','z');
title('input data')

subplot(1,3,2);grid;hold;box;
plot(wynikxyz(1,:));
plot(wynikxyz(2,:));
plot(wynikxyz(3,:));
title(['newerb training data , mse: ' num2str(tr_mse_ff)])

subplot(1,3,3);grid;hold;box;
plot(wyniki_test(1,:));
plot(wyniki_test(2,:));
plot(wyniki_test(3,:));
title(['newrb test data , mse: ' num2str(test_mse_ff)])

