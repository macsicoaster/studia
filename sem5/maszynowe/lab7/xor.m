clear all %#ok
close all
clc

x1 = [0 0 1 1];
x2 = [0 1 0 1];
y = [0 1 1 0];

X = [x1; x2];

%figure(1)
%plot(x1,'m*');grid;hold;
%plot(x2, '*');

%figure(2)
%plot(y,'*');grid;

%% feedforwardnet

liczba_n_h1 = 5;
liczba_n_h2 = 7;

NN_model = feedforwardnet([liczba_n_h1 liczba_n_h2]);
NN_model.trainParam.epochs = 1500;
NN_model.trainParam.goal = 1e-5;
NN_model.trainParam.show = 50;

NN_model = train(NN_model,X,y);
view(NN_model);

ynn = sim(NN_model,X);

figure(3)
plot(ynn, '*');grid;hold;
plot(y,'*r');title('feedforwardnet');