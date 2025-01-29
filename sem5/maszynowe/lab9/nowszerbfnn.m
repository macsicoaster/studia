clear all %#ok
close all
clc

%%
x1 = rand(300,2)*10;
x2 = x1 + 100;
X = [x1; x2]';
y = [ones(1,size(x1,1))*0.2 ones(1,size(x2,1))*0.7];

figure(1);
plot(X(1,:),X(2,:),'*');grid;hold;
xlabel('x1')
ylabel('x2')
title('Dane wejsciowe')

figure(2);
plot(y,'ok');grid;hold;
xlabel('number of samples')
ylabel('label')
title('Dane wyjsciowe')

%% RBFNN
MN = 200; % liczba neuronow w warstwie ukrytej
DF = 5; % wspolczynnik uczenia, czestotliwosc odswiezania informacji na temat uczenia
GOAL = 0; % celowy blad
SPREAD = 0.7; % rozrzut funkcji radialnych
NN_model_rbf = newrb(X,y,GOAL,SPREAD,MN,DF);
view(NN_model_rbf)

xt = X + (randn(size(X)) * 0.05);
ynn = sim(NN_model_rbf, xt);

figure(3);
plot(y,'*g');grid;hold;plot(ynn,'*r')
xlabel('x')
ylabel('y')
legend('orig','nn_o_u_t')
error = (sum(abs(y-ynn))/length(y));