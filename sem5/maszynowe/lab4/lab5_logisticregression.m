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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
plot(x, y, '*', 'LineWidth', 3);grid;hold;
xlabel('x');ylabel('y');
% plot(x,ye1,'k','LineWidth',3);
title('Logistic Regression - data');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

log_fun=@(x_in) 1./(1+exp(-x_in));
alpha_optim = glmfit(x1,y1','binomial');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ye1 = log_fun(alpha_optim(1)+alpha_optim(2)*x1);