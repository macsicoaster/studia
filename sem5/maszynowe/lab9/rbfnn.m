% sieci neuronowe laboratorium 1
clc
clear all %#ok
close all

% funkcja sinus, zakres wartosci od -10 do 10
x = -10:0.1:10;
x1 = x(2:length(x));
x2 = x(1:length(x)-1);
X = [x1; x2];
y = sin(x1);

% wykres funkcji sinus
figure(1);
plot(x1);grid;hold;plot(x2,'r')
plot(y,'g')

%% RBFNN
MN = 50; % liczba neuronow w warstwie ukrytej
DF = 5; % wspolczynnik uczenia, czestotliwosc odswiezania informacji na temat uczenia
GOAL = 0; % celowy blad
SPREAD = 0.5; % rozrzut funkcji radialnych
NN_model_rbf = newrb(X,y,GOAL,SPREAD,MN,DF);
view(NN_model_rbf)

xt = x1 + (randn(size(x1)) * 0.05);
ynn = sim(NN_model_rbf, xt);

figure(2);
plot(xt, ynn, 'r'); grid; hold on; plot(x1, y, 'g');
xlabel('x')
ylabel('y')
legend('nn_output', 'original')

%% NEWRBE
SPREAD = 0.7; % rozrzut funkcji radialnych
NN_model_rbf = newrbe(X,y,SPREAD);

Xt = X+(randn(size(X))*0.05);

y_nn = NN_model_rbf(Xt);

figure(3);
plot(y,'g');grid;hold;plot(y_nn,'r')
xlabel('x')
ylabel('y')
legend('orig','nn_o_u_t')
error = (sum(abs(y-y_nn))/length(y));

view(NN_model_rbf)

xt = x1 + (randn(size(x1)) * 0.05);
ynn = sim(NN_model_rbf, xt);

figure(4);
plot(xt, ynn, 'r'); grid; hold on; plot(x1, y, 'g');
xlabel('x')
ylabel('y')
legend('nn_output', 'original')

%%
