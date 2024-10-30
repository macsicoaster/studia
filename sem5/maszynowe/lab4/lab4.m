close all
clear all %#ok<CLALL>
clc

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

A = randn(2, 1);
alpha = 0.00001; % stały parametr
epochs = 30;

disp('optimization...')
figure(1);
grid on;
hold on;
xlabel('number of epochs');
ylabel('error');
box on;
tic;
for k = 1:epochs
    %alpha = length(X)/(1.0+(k*length(X)));

    for n_data = 1:length(X)
        Ye = X(n_data, :) * A;
        e = Y(n_data) - Ye;
        % e = mse(Y(n_data), Ye);
        D_A = alpha * e * X(n_data, :);
        A = A + D_A';
    end
    ye = X * A;
    e_epoch = mse(Y, ye);
    figure(1);
    plot(k, e_epoch, '*m');
end
training_time = toc;

total_error = mse(Y, ye);
R2 = 1 - sum((y-ye').^2)/sum((y-mean(y)).^2);

clc
figure(2);
plot(x,y,'*','LineWidth',3);grid;hold;xlabel('x');ylabel('y');
plot(x, ye, 'k', 'LineWidth', 3);
title('Linear regression - GD');