%% start
close all
clear all %#ok<CLALL>
clc

%% UWAGA
% R2 - to współczynik zgodności mozemy sobie za jego pomocą określic czy
% nasze nowe modele korespondują z naszymi danymi jakby był 1 to model
% przechodziłby idealnie przez każdy punkt co jest niekoniecznie chciane
% przez nas
% myśle że można to jakoś w sprawku ująć ładnie 

%przpeuścić przez indeks każdego


%% deklaracja danych
num_elements = 50;
a = 7; % 4 cyfra indx
b = 2; % 5 cyfra indx
c = 4; % 6 cyfra indx  
x = 1:1:num_elements;

y = a * x + b * randn(1, num_elements);
y = y + c;
Y = y';
X = x';
X = [ones(size(X)) X];

%% simple linear slope
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

A = randn(2, 1);
alpha = [0.000001,0.000005, 0.00001,0.00005,0.0001,0.0005]; 
% stały parametr wpływa na szybkość osiągnania optimum
epochs = 30;

%idk po co ale jest
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
        zmienna = [zmienna, e_epoch]; %#ok<AGROW>
        if times == 3
            e_badane = e_epoch;
            y_test = ye;
        end
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


total_error = e_badane; % nie wiem co to tu robi ani po co nam to, czat pokazuje ze to mean square error ktory liczymy sami nizej
R25 = 1 - sum((Y - y_test).^2) / sum((Y - mean(Y)).^2); % współczynnik zgodności dla alpha = 0.00001 i 30 epok

%% gradient w zależności od liczby epok


figure(14);
plot(x, y, '*','LineWidth', 3);
title('Linear regression - GD, dependence on epochs');
hold on;
grid on;
xlabel('x');
ylabel('y');

width = [5,4,3,2,1];
epochs = [10, 20, 30, 40, 50];
alpha = 0.00001;
for times = 1:5
    zmienna = [];
    A2 = A;
    for k = 1:epochs(times)
        for n_data = 1:length(X)
            Ye = X(n_data, :) * A2;
            e = Y(n_data) - Ye;
            % e = mse(Y(n_data), Ye);
            D_A = alpha * e * X(n_data, :);
            A2 = A2 + D_A';
        end
        ye = X * A2;
        e_epoch = mse(Y, ye);
        zmienna = [zmienna, e_epoch]; %#ok<AGROW>
        if times == 3
            e_badane = e_epoch;
            y_test = ye;
        end
    end

    figure(14);
    plot(x, ye, 'k', 'LineWidth', 3, 'Color', colors(times));
end
figure(14);
legend('dane', '10 epok', '20 epok', '30 epok', '40 epok', '50 epok');

%% polymonial nasze dane
d = 2; % my to chcemy???
y_poly1 = a * x + b *((x +randn(1,num_elements)).^d);
y_poly1 = y_poly1 + c;

Y_poly1  = y_poly1';
X = [ones(size(X)) X X.^2];
B1 = X\Y_poly1;
ye1 = X*B1;

figure(7);grid on;
hold on;
plot(y_poly1,'*', 'LineWidth', 3);
plot(x, ye1,'k', 'LineWidth', 3);

xlabel('x');
ylabel('y');
title('polynomial regression')
y_poly1;

R26 = 1 - sum((Y_poly1 - ye1).^2) / sum((Y_poly1 - mean(Y_poly1)).^2); % współczynnik zgodności dla 2 stopnia naszych danych

%% polymoniar sinus nadal nie wiem czy to do czegoś jest potrzebne
y_poly = sin(x); %moze z sinusa to???
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
ylim([-1.5 1.5]);

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
ylim([-1.5 1.5]);
title('degree - 2');
legend('polynominal values', 'new data')

% drugi stopień

w = polyfit(x,y_poly,6);
xt = 0:1:50;
yt = polyval(w,xt);

figure(10);
plot(xt,yt,'k','LineWidth',3);grid;hold;
plot(x,y_poly,'*','LineWidth',3);

xlabel('x');
ylabel('y');

ylim([-1.5 1.5]);
title('degree - 6');
legend('polynominal values', 'new data')

w = polyfit(x,y_poly,8);
xt = 0:1:50;
yt = polyval(w,xt);

figure(11);
plot(xt,yt,'k','LineWidth',3);
grid;
hold; 
plot(x,y_poly,'*','LineWidth',3);

xlabel('x');
ylabel('y');
ylim([-1.5 1.5]);
title('degree - 8');
legend('polynominal values', 'new data')

figure(12);
w = polyfit(x,y_poly,5);
xt = 0:1:50;
yt = polyval(w,xt);

plot(xt,yt,'k','LineWidth',3);
grid;
hold;
xlabel('x');

ylim([-1.5 1.5]);
plot(x,y_poly,'*','LineWidth',3);
title('degree - 5');


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



%y_binarne = double(y > median(y)); % na necie mowia i chat mowi ze tu musza byc liczby binarne nwm czm
y_bin = y/1000; %druga opcja bo liczby nie musza byc 0 albo jeden tylko miedzy 0 a 1 i to dziala  



% ,,In logistic regression, the target variable (y) must be binary because logistic regression is specifically 
% designed to model probabilities for binary outcomes (e.g., 0 or 1, yes or
% no, true or false)."
%Therefore, if y is not binary, the model's output won’t correctly represent a probability for a binary classification task.

% działa to tak, że:
%If a value in y is greater than the median, it will be converted to 1.
%If a value in y is less than or equal to the median, it will be converted to 0.

x1 = x(1:2:end)'; 
y1 = y_bin(1:2:end)'; 
x2 = x(2:2:end)';
y2 = y_bin(2:2:end)';

log_fun = @(x_in) 1 ./ (1 + exp(-x_in));
alpha_optim = glmfit(x1, y1, 'binomial');
ye_log = log_fun(alpha_optim(1) + alpha_optim(2) * x1');

figure(13);
plot(x, y_bin, '*', 'LineWidth', 3);
grid;
hold;
xlabel('x');
ylabel('y');
title('Logistic Regression');
plot(x, ye_log, 'r', 'LineWidth', 3);
legend('Data', 'Logistic Fit');




