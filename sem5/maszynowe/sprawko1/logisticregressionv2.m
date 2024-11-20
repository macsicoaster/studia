num_elements = 50;
a = 7; % 4 cyfra indx
b = 5; % 5 cyfra indx
c = 4; % 6 cyfra indx  
x = 1:1:num_elements;

y = a * x + b * randn(1, num_elements);
y = y + c;
Y = y';
X = x';
X = [ones(size(X)) X];
% Tworzenie danych binarnych
y_bin = double(y > median(y)); % Dane binarne (0 lub 1)

% Podział danych na zbiór treningowy i testowy
x1 = x(1:2:end)';
y1 = y_bin(1:2:end)';
x2 = x(2:2:end)';
y2 = y_bin(2:2:end)';

% Funkcja logistyczna
log_fun = @(x_in) 1 ./ (1 + exp(-x_in));

% Dopasowanie modelu logistic regression
alpha_optim = glmfit(x1, y1, 'binomial');

% Predykcja dla całego zakresu x
ye_log = log_fun(alpha_optim(1) + alpha_optim(2) * x');

% Wykres
figure(13);
plot(x, y_bin, '*', 'LineWidth', 3); % Dane oryginalne (binarne)
hold on;
plot(x, ye_log, 'r', 'LineWidth', 3); % Dopasowana funkcja logistyczna
grid on;
xlabel('x');
ylabel('y');
title('Logistic Regression');
legend('Data', 'Logistic Fit');
hold off;
