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
liczba_n_h1 = 5;
liczba_n_o = 1;

siec = newff([zakres; zakres], [liczba_n_h1 liczba_n_o], {'tansig', 'purelin'}, 'trainlm');
siec.trainParam.epochs = 150;
siec.trainParam.goal = 1e-5;

siec = train(siec, X', y');

ynn = sim(siec, X');

%gensim(siec,-1);

hintonw(W)
hintonwb(W,b)