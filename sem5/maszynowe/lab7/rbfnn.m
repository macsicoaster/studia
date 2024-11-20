clear all %#ok
close all
clc

x1 = -10:0.1:10;
x2 = x1(2:length(x1));
x1 = x1(1:length(x1)-1);

X = [x1; x2];
y = sin(x1);

figure(1)
