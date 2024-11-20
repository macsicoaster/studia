%% start
close all
clear all %#ok
clc
%% deklaracja danych
% a, b i c = trzy ostatnie cyfry indeksu
num_elements = 50;
a = 7;
b = 2; 
c = 4;
x = 1:1:num_elements;

y = a * x + b * randn(1, num_elements);
y = y + c;
Y = y';
X = x';
X = [ones(size(X)) X];

%% simple linear slope
% opis: to jest prosta regresja liniowa, gdzie y = B1 * x. Prosta regresja liniowa to metoda statystyczna, która pozwala na zbadanie zależności między dwiema zmiennymi. W tym przypadku zmienna y jest zależna od zmiennej x.
B1 = y / x;
ye1 = B1 * x;

figure(1)
plot(x,y,'*', 'LineWidth', 3);
grid on;
hold on;
xlabel('x');
ylabel('y');

plot(x,ye1,'k', 'LineWidth', 3);

title('Simple Linear Regression (slope)')

R21 = 1 - sum((y-ye1).^2)/sum((y - mean(y)).^2);

%% simple linear slope and intercept 
% według czatu to to samo co least squares dlatego daje taki sam
% współczynnik zgodności i współczynniki prostej regresji
% opis: to jest prosta regresja liniowa, gdzie y = B2(1) + B2(2) * x. Prosta regresja liniowa to metoda statystyczna, która pozwala na zbadanie zależności między dwiema zmiennymi. W tym przypadku zmienna y jest zależna od zmiennej x.
B2 = X \ Y;
ye2 = X * B2;

figure(2);
plot(x,y,'*', 'LineWidth', 3);
grid on;
hold on;
xlabel('x');
ylabel('y');

plot(x,ye2,'k', 'LineWidth', 3);
title('Simple Linear Regression (slope and intercept)')

%inny wektor X
% czy wspolczynnik zgodnosci mial byc macierza czy liczba??
R22 = 1 - sum((y-ye2').^2)/sum((y - mean(y)).^2);

%% least squares
% opis: to jest prosta regresja liniowa, gdzie y = B3(1) + B3(2) * x. Prosta regresja liniowa to metoda statystyczna, która pozwala na zbadanie zależności między dwiema zmiennymi. W tym przypadku zmienna y jest zależna od zmiennej x.

xm = sum(x)/length(x);
ym = sum(y)/length(y);

a1 = sum((x-xm).* (y-ym))/sum((x-xm).^2);
a0 = ym - (a1 * xm);

B3 = [a0;a1];

ye3 = X*B3;

figure(3);
plot(x,y,'*', 'LineWidth', 3);
grid on;
hold on;
xlabel('x');
ylabel('y');

plot(x,ye3,'k', 'LineWidth', 3);
title('Simple Linear Regression (least squares)')

R23 = 1 - sum((y-ye3').^2)/sum((y - mean(y)).^2);
 
%% multiple linear regression
% opis: to jest prosta regresja liniowa, gdzie y = A' * X. Prosta regresja liniowa to metoda statystyczna, która pozwala na zbadanie zależności między dwiema zmiennymi. W tym przypadku zmienna y jest zależna od zmiennej x.

X_mult = [ones(size(X)) X X*10];
A = regress(Y,X);
ye4 = A'*X';

figure(4)
plot(x,y,'*', 'LineWidth', 3);
grid on;
hold on;
xlabel('x');
ylabel('y');

plot(ye4,'k', 'LineWidth', 3);

title('Multiple Linear Regression')

R24 = 1 - sum((y-ye4).^2)/sum((y - mean(y)).^2);


%% gradient w zależności od alpha
% opis: to jest prosta regresja liniowa, gdzie y = A' * X. Prosta regresja liniowa to metoda statystyczna, która pozwala na zbadanie zależności między dwiema zmiennymi. W tym przypadku zmienna y jest zależna od zmiennej x.

A = randn(2, 1);
alpha = [0.000001,0.000005, 0.00001,0.00005,0.0001,0.0005]; 
% stały parametr wpływa na szybkość osiągnania optimum
epochs = 30;

%idk po co ale jest (maciek wie i napisal ponizej)
% epochs sluzą do określenia liczby iteracji, które zostaną wykonane w celu znalezienia optymalnych wartości współczynników A.
disp('optimization...')


figure(5);
grid on;
hold on;
xlabel('number of epochs');
ylabel('error');
title('Linear regression error, dependence on alpha');
box on;

figure(6);
plot(x, y, '*','LineWidth', 3);
title('Linear regression - GD, dependence on alpha');
hold on;
grid on;

colors = ['r', 'g', 'b', 'm', 'c', 'y'];
tic;

for times =  1 : 6
    zmienna = [];
    A2 = A;
    for k = 1:epochs
        for n_data = 1:length(X)
            Ye = X(n_data, :) * A2;
            e = Y(n_data) - Ye;
            % e = mse(Y(n_data), Ye);
            D_A = alpha(times) * e * X(n_data, :);
            A2 = A2 + D_A';
        end
        ye = X * A2;
        e_epoch = mse(Y, ye);
        zmienna = [zmienna, e_epoch];
    end

    figure(6);
    plot(x, ye, 'k', 'LineWidth', 3, 'Color', colors(times));
    %add marker in plot
    figure(5);
    plot(1:k, zmienna, '*','Color', colors(times));
end
training_time = toc;
figure(6);
legend('dane', '\alpha 0.000001', '\alpha 0.000005', '\alpha 0.00001', ...
    '\alpha 0.00005', '\alpha 0.0001', '\alpha 0.0005');
figure(5);
legend('\alpha 0.000001', '\alpha 0.000005', '\alpha 0.00001', ...
    '\alpha 0.00005', '\alpha 0.0001', '\alpha 0.0005');
total_error = mse(Y, ye);
R25 = 1 - sum((Y - ye).^2) / sum((Y - mean(Y)).^2);

%% polymonial
d =2; % my to chcemy???
% to jest regresja wielomianowa, gdzie y = B4(1) + B4(2) * x + B4(3) * x^2. Regresja wielomianowa to metoda statystyczna, która pozwala na zbadanie zależności między dwiema zmiennymi. W tym przypadku zmienna y jest zależna od zmiennej x.
% d służy do określenia stopnia wielomianu, który zostanie użyty do dopasowania danych.
y_poly = a * x + b *((x +randn(1,num_elements)).^d);
y_poly = y_poly + c;

Y_poly  = y_poly';
X = [ones(size(X)) X X.^2];
B1 = X\Y_poly;
ye1 = X*B1;

figure(7)
plot(x,y_poly,'*', 'LineWidth', 3);
grid on;
hold on;
xlabel('x');
ylabel('y');
plot(x, ye1,'k', 'LineWidth', 3);
title('polynomial regression')

y_poly = sin(x); %moze z sinusa to???
% sinus jest funkcją nieliniową, więc regresja liniowa nie będzie działać (wg copilota)
w = polyfit(x,y_poly,1);
xt = 0:1:50;
yt = polyval(w,xt);


figure(8);
plot(xt,yt,'k','LineWidth',3);
grid on;
hold on;
plot(x,y_poly,'*','LineWidth',3);
xlabel('x');
ylabel('y');

title('degree -1');
legend('polynominal values', 'new data')

w = polyfit(x,y_poly,2);
xt = 0:1:50;
yt = polyval(w,xt);

figure(9);
plot(xt,yt,'k','LineWidth',3);
grid on;
hold on;
plot(x,y_poly,'*','LineWidth',3);
xlabel('x');
ylabel('y');
title('degree - 2');
legend('polynominal values', 'new data')

% drugi stopień

w = polyfit(x,y_poly,3);
xt = 0:1:50;
yt = polyval(w,xt);

figure(10);
plot(xt,yt,'k','LineWidth',3);grid;hold;
plot(x,y_poly,'*','LineWidth',3);

xlabel('x');
ylabel('y');

title('degree - 3');
legend('polynominal values', 'new data')

w = polyfit(x,y_poly,4);
xt = 0:1:50;
yt = polyval(w,xt);

figure(11);
plot(xt,yt,'k','LineWidth',3);
grid;
hold; 
plot(x,y_poly,'*','LineWidth',3);

xlabel('x');
ylabel('y');

title('degree - 4');
legend('polynominal values', 'new data')

%%
% logistic nie działa na danych z zajęć idk co zmienić
% 
% x1 = x(1, 1:2:end);
% x2 = x(1, 2:2:end);
% y1 = y(1, 1:2:end);
% y2 = y(1, 2:2:end);
% log_fun = @(x_in) 1./(1 + exp(-x_in));
% alpha_optim = glmfit(x1, y1', 'binomial');
% ye1 = log_fun(alpha_optim(1) + alpha_optim(2) * x1);
% 
% 
% figure(12);
% plot(x, y, '*', 'LineWidth', 3);grid;hold;
% xlabel('x');
% ylabel('y');
% title('Logistic Regression');
% plot(x, ye1, 'r', 'LineWidth', 3);
% legend('data', 'regression');
% 

%%
% 
%Logistic
y_binarne = double(y > median(y)); % na necie mowia i chat mowi ze tu musza byc liczby binarne nwm czm
% ,,In logistic regression, the target variable (y) must be binary because logistic regression is specifically 
% designed to model probabilities for binary outcomes (e.g., 0 or 1, yes or
% no, true or false)."
%Therefore, if y is not binary, the model's output won’t correctly represent a probability for a binary classification task.

% działa to tak, że:
%If a value in y is greater than the median, it will be converted to 1.
%If a value in y is less than or equal to the median, it will be converted to 0.

x1 = x(1:2:end)'; 
y1 = y_binarne(1:2:end)'; 

log_fun = @(x_in) 1 ./ (1 + exp(-x_in));
alpha_optim = glmfit(x1, y1, 'binomial');
ye1 = log_fun(alpha_optim(1) + alpha_optim(2) * x');

figure(12);
plot(x, y_binarne, '*', 'LineWidth', 3);
grid;
hold;
xlabel('x');
ylabel('y');
title('Logistic Regression');
plot(x, ye1, 'r', 'LineWidth', 3);
legend('Data', 'Logistic Fit');


