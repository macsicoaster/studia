% sieci neuronowe laboratorium 1
clc
clear all %#ok
close all

% funkcja sinus, zakres wartosci od -10 do 10
x = -10:0.1:10;
x1 = x(2:length(x)-1);
x2 = x(1:length(x)-2);
x3 = x(3:length(x));
X = [x1; x2];
%y = sin(x1);
%y = (sin(2*x1)+0.2*sin(8*x1)).*(exp(-x1));
y = exp(sin(x1)+0.1*sin(5*x1));

% wykres funkcji sinus
figure(1);
grid on; hold on;
plot(y, 'g');
plot(x1, 'r');
plot(x2, 'b');
legend('sin(x)', 'x1', 'x2');
title('training data');

figure(2)
plot(X');grid;hold;
plot(y,'g');title('training data');

zakres = [-20 20];
liczba_n_h1 = 12;
liczba_n_h2 = 15;
liczba_n_o = 1;

%siec = feedforwardnet([liczba_n_h1 liczba_n_h1 liczba_n_o], 'trainlm');
%siec.layers{1}.transferFcn = 'tansig';
%siec.layers{2}.transferFcn = 'tansig';
%siec.layers{3}.transferFcn = 'purelin';
%siec.trainParam.epochs = 150;
%siec.trainParam.goal = 1e-5;

%siec = train(siec, X, y);

%ynn = sim(siec, X);

%figure(3)
%plot(ynn);grid;hold
%plot(y,'g');title('training data');

%% druga wersja z feedforwardnet - łatwiejsza w obsłudze
NN_model = feedforwardnet([liczba_n_h1 liczba_n_h2]);
NN_model.trainParam.epochs = 1500;
NN_model.trainParam.goal = 1e-5;
NN_model.trainParam.show = 50;

NN_model = train(NN_model, X, y);
view(NN_model);

Xt = X + (randn(size(X)) * 0.05);

% y_nn = NN_model_t(Xt);
ynn = sim(NN_model, Xt);

figure(3)
plot(ynn);grid;hold
plot(y,'g');title('training data');
%%


%gensim(siec,-1);

%hintonw(W)
%hintonwb(W,b)