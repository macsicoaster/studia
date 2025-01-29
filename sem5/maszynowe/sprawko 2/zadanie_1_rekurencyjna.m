clear all %#ok
close all
clc

%% wprowadzanie danych wejściowych
x = -10:0.1:10;
x1 = x(1:length(x)-1);
x2 = x(2:length(x));
X = [x1;x2];
y = sin(x1);

% wykres z danymi wejściowymi
figure(1);grid;hold;box on;
plot(y,'m');
plot(x1,'r');
plot(x2,'g');
title('Training data');
legend('expected output', 'input vector 1', 'input vector 2')

zakres = [-20 20]; % maksymalny zakres danych wejściowych, może być większy
% od x ale nie mniejszy


%% definiowanie struktury sieci
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 


siec = newelm([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

%parametry sieci
siec.trainParam.epochs = 700; 
siec.trainParam.goal = 0; 

%trening sieci
siec = train(siec,X,y);


%% praca sieci

% dodanie szumów do danych
Xt = X + (randn(size(X))*0.05);


ynn = sim(siec,X);
ynn2 = sim(siec,Xt);
input_mse_rec = mse(y,ynn); % błąd przy symulacji sieci na danych treningowych
test_error_rec = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(2);
subplot(2,1,1);hold;grid; box;
plot(y,'m');
plot(ynn2,'g');
title(['newelm test data, mse: ', num2str(test_error_rec)]);
legend('targeted result', 'neural network result')

subplot(2,1,2);hold;grid; box ;
plot(y,'m');
plot(ynn,'g');
title(['newelm training data, mse: ', num2str(input_mse_rec)]);
legend('targeted result', 'neural network result')

