clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num_elements = 50;
a = 5;
b = 15;
c = 7;
x = 1:1:num_elements;
y = a * x + b * randn(1, num_elements);
y = y + c;

Y = y'; X = x';
% X = [ones(size(X)) X];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
plot(x,y,'*','LineWidth',3);grid;hold
xlabel('x');ylabel('y');
title('Regression data')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w = polyfit(x, y, 1);
xt = -10:0.5:10;
yt = polyval(w, xt);

figure(2)
plot(xt, yt, 'k', 'LineWidth', 3); grid; hold; xlabel('x'); ylabel('y');
plot(x, y, '*', 'LineWidth', 3);
title('degree - 1'); legend('polynomial values', 'new data')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w = polyfit(x, y, 2);
xt = -10:0.5:10;
yt = polyval(w, xt);

figure(3)
plot(xt, yt, 'k', 'LineWidth', 3); grid; hold; xlabel('x'); ylabel('y');
plot(x, y, '*', 'LineWidth', 3);
title('degree - 2'); legend('polynomial values', 'new data')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[w, D] = polyfit(x, y, 1);
[ye, D1] = polyval(w, x, D);
figure(4)
plot(x, y, '*k', 'LineWidth', 3); grid; hold;
plot(x, ye, 'r', 'LineWidth', 3);
plot(x, ye - 1 * D1, 'g', 'LineWidth', 3);
plot(x, ye + 1 * D1, 'g', 'LineWidth', 3);
xlabel('x'); ylabel('y');
title('Regression'); legend('values', 'regression', 'bounds')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[w, D] = polyfit(x, y, 1);
[yt, D1] = polyval(w, x, D);
X = [X ones(size(X))]; %zmiana kolejnosci
yt = X * w';
figure(5)
plot(x, y, '*k', 'LineWidth', 3); grid; hold;
plot(x, ye, 'r', 'LineWidth', 3);
plot(x, ye - 1 * D1, 'g', 'LineWidth', 3);
plot(x, ye + 1 * D1, 'g', 'LineWidth', 3);
xlabel('x'); ylabel('y');