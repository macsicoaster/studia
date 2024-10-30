clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num_elements = 50;
a = -2;
b = 5;
c = 7;
x = 1:1:num_elements;
y = a * x + b * randn(1, num_elements);
y = y + c;

Y = y';
X = x';
X = [ones(size(X)) X];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = randn(2, 1);
%alpha = 0.00001;
alpha = length(X)/(1.0+(k*length(X)));
epochs = 30;