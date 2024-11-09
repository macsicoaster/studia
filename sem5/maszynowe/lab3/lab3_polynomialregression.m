clear all
close all
clc

num_elements = 50;
a = -2; b = 1; c = 7; d = 2; x = 1:1:num_elements;
y = a * x + b * ((x + randn(1, num_elements)) .^ d);
y = y + c; Y = y'; X = x';

X = [ones(size(X)) X X .^ 2];
B3 = X \ Y;
ye3 = X * B3;
figure(1)
plot(x, y, '*', 'LineWidth', 3); grid; hold; xlabel('x'); ylabel('y');
plot(x, ye3, 'k', 'LineWidth', 3); title('Polynomial regression')

% inny wektor X !!!
% wyzszego rzedu???

R2_3 = 1 - sum((y - ye3') .^ 2) / sum((y - mean(y)) .^ 2);

y = sin(x);

