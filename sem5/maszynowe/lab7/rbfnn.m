clear all %#ok
close all
clc

x1 = -10:0.1:10;
x2 = x1(2:length(x1));
x1 = x1(1:length(x1)-1);

X = [x1; x2];
y = sin(x1);

figure(1)
plot(x1);grid;hold;plot(x2,'r');
plot(y,'g');
figure(2)
plot(X');grid;hold
plot(y,'g');

MN=50;
DF = 5;
GOAL = 0;
SPREAD = 0.5;
NN_model_rbf = newrb(X,y,GOAL,SPREAD,MN,DF);

Xt = X + randn(size(X))*0.05

y_nn = sim(NN_model_rbf,Xt);

figure(3)
plot(y)
grid;hold;
plot(y_nn,'r');

%%
% BRAK DALEJ KODU, TUTAJ JESZCZE COS BEDZIE!!!!!!!
%%
