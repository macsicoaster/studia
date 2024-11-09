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

Y = y'; X = x'; X = [ones(size(X)) X X * 10];

A = regress(Y, X);
Ye = A' * X';

figure(1)
plot(Ye, 'k', 'LineWidth', 3); grid; hold; xlabel('x'); ylabel('y');
plot(x, y, '*', 'LineWidth', 3);
title('Multiple Linear Regression')