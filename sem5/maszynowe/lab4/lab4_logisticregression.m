clear all
close all
clc

num_elements = 100;
a = 0.1;
b = 0.001;
c = 0.1;
x = linspace(0,1,num_elements);
y = a*x + b*randn(1,num_elements);
y = y + c;
x1 = x(1,1:2:end);
x2 = x(1,2:2:end);
y1 = y(1,1:2:end);
y2 = y(1,2:2:end);
Y = y';
X = x';
X = [X ones(size(X))];
x = x1;
y = y1;

figure(1);
plot(x,y,'*','LineWidth',3);grid;hold;xlabel('x');ylabel('y');
title('Logistic regression - data');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cost_function = @(params) - 1/length(X)*sum((X)*sum(Y.*log(logsig(X*params')))+((1-Y).*log(1-logsig(X*params'))));

options = optimset('Display','iter','MaxIter',150);

params_init=randn(1,size(X,2));
params_low_bounds = [];
params_up_bounds = [];

params_optim = lsqnonlin(cost_function,params_init,params_low_bounds,params_up_bounds,options);

ye1= logsig(params_optim(1) *X(:,1) + params_optim(2)*X(:,2));

R2_1 = 1-sum((y-ye1').^2)/sum((y-mean(y)).^2);