clear all %#ok
close all
clc

%% wprowadzanie danych wejściowych
x = -10:0.1:10;
x1 = x(1:length(x)-1);
x2 = x(2:length(x));
X = [x1;x2];
y = sin(x1);
Xt = X + (randn(size(X))*0.05);

zakres = [-20 20]; % maksymalny zakres danych wejściowych, może być większy
% od x ale nie mniejszy

%% metoda uczenia = trainlm
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 

siec = newelm([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec.trainParam.epochs = 700; 
siec.trainParam.goal = 0; 

siec = train(siec,X,y);

ynn2 = sim(siec,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,1);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newelm test data, mse: ', num2str(test_error),' training method = trainlm'])

%% metoda uczenia = trainrp
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 

siec = newelm([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainrp');

siec.trainParam.epochs = 700; 
siec.trainParam.goal = 0; 

siec = train(siec,X,y);

ynn2 = sim(siec,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,2);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newelm test data, mse: ', num2str(test_error),' training method = trainrp'])

%% metoda uczenia = traincgp
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 

siec = newelm([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'traincgp');

siec.trainParam.epochs = 700; 
siec.trainParam.goal = 0; 

siec = train(siec,X,y);

ynn2 = sim(siec,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,3);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newelm test data, mse: ', num2str(test_error),' training method = traincgp'])

%% metoda uczenia = traingdm
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 

siec = newelm([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'traingdm');

siec.trainParam.epochs = 700; 
siec.trainParam.goal = 0; 

siec = train(siec,X,y);

ynn2 = sim(siec,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,4);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newelm test data, mse: ', num2str(test_error),' training method = traingdm'])