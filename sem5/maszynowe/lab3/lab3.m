clear all
close all
clc

num_elements = 50;
a = -2;
b = 5;
c = 7;
x = 1:1:num_elements;
y = a * x + b * randn(1, num_elements);
y = y + c;

Y = y'; X = x';
X = [ones(size(X)) X];
B1 = y / x;
%X = X+0.5*randn(size(X));
ye1 = B1 * x;

figure(1)
plot(x, y, '*', 'LineWidth', 3); grid; hold; xlabel('x'); ylabel('y');
plot(x, ye1, 'k', 'LineWidth', 3);
title('Simple Linear Regression (slope)')

B2 = X \ Y;
ye2 = X * B2;

figure(2)
plot(x, y, '*', 'LineWidth', 3); grid; hold;
xlabel('x'); ylabel('y');
plot(x, ye2, 'k', 'LineWidth', 3);
title('Simple Linear Regression (slope and intercept)')

%inny wektor X !!!

R21 = 1 - sum((y - ye1) .^ 2) / sum((y - mean(y)) .^ 2);
R22 = 1 - sum((y - ye2) .^ 2) / sum((y - mean(y)) .^ 2);

xm = sum(x) / length(x);
ym = sum(y) / length(y);

a1 = (sum((x - xm) .* (y - ym))) ./ (sum((x - xm) .^ 2));
a0 = ym - (a1 * xm);

B3 = [a0; a1];

ye3 = X * B3;

figure(3)
plot(x, y, '*', 'LineWidth', 3); grid; hold;
xlabel('x'); ylabel('y');
plot(x, ye3, 'k', 'LineWidth', 3);
title('Linear regression')

R23 = 1 - sum((y - ye3) .^ 2) / sum((y - mean(y)) .^ 2);
