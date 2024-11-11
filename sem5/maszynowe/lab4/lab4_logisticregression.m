clear all %#ok
close all
clc
num_elements = 100;
a = 7;
b = 5;
c = 4;
x = linspace(0, 1, num_elements);
y = a * x + b * randn(1, num_elements);
y = y + c;
x1 = x(1, 1:2:end);
x2 = x(1, 2:2:end);
y1 = y(1, 1:2:end);
y2 = y(1, 2:2:end);
Y = y1';
X = x1';
X = [X ones(size(X))];
x = x1;
y = y1;
figure(1);
plot(x, y, '*', 'LineWidth', 3);
grid;
hold;
xlabel('x');
ylabel('y');
title('Logistic Regression - data');
cost_function = @(params) - 1 / length(X) * sum((Y .* log(logsig(X * params'))) + ((1 - Y) .* log(1 - logsig(X * params'))));
options = optimset('Display', 'iter', 'MaxIter', 150);
params_init = randn(1, size(X, 2));
params_low_bounds = [];
params_up_bounds = [];
params_optim = lsqnonlin(cost_function, params_init, params_low_bounds, params_up_bounds, options);
ye1 = logsig(params_optim(1) * X(:, 1) + params_optim(2) * X(:, 2));
R2_1 = 1 - sum((y - ye1') .^ 2) / sum((y - mean(y)) .^ 2);
figure(2)
plot(x, y, '*', 'LineWidth', 3);
grid;
hold;
xlabel('x');
ylabel('y');
plot(x, ye1, 'k', 'LineWidth', 3);
title('logistic regresion');
Y = y2';
X = x2';
X = [X ones(size(X))];
x = x2;
y = y2;
ye1 = logsig(params_optim(1) * X(:, 1) + params_optim(2) * X(:, 2));
R2_2 = 1 - sum((y - ye1') .^ 2) / sum((y - mean(y)) .^ 2);
figure(3)
plot(x, y, '*r', 'LineWidth', 3);
grid;
hold;
xlabel('x');
ylabel('y');
plot(x, ye1, 'k', 'LineWidth', 3);
title('logistic regresion (modified input dataset)');