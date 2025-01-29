clear all %#ok
close all
clc
x = 0:0.1:10;
x1 = x(1:length(x)-2);
x2 = x(2:length(x)-1);
x3 = x(3:length(x));
X = [x1;x2;x3];
y = (sin(2*x1)+0.2*sin(8*x1)).*exp(-x1);
Xt = X + (randn(size(X))*0.05);

zakres = [-20 20];

%% LICZBA NEURONOW = 15
liczba_n_h1 = 15; 
liczba_n_o = 1; 

siec_newff = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec_newff.trainParam.epochs = 700; % zadana liczba epok 
siec_newff.trainParam.goal = 0; %  docelowy błąd 

siec_newff = train(siec_newff,X,y);

ynn2 = sim(siec_newff,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,1);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newff test data, mse: ', num2str(test_error),' neuron count = 15'])


%% LICZBA NEURONOW = 25
liczba_n_h1 = 25; 
liczba_n_o = 1; 

siec_newff = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec_newff.trainParam.epochs = 700; % zadana liczba epok 
siec_newff.trainParam.goal = 0; %  docelowy błąd 

siec_newff = train(siec_newff,X,y);

ynn2 = sim(siec_newff,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,2);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newff test data, mse: ', num2str(test_error),' neuron count = 25'])

%% LICZBA NEURONOW = 50
liczba_n_h1 = 50; 
liczba_n_o = 1; 

siec_newff = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec_newff.trainParam.epochs = 700; % zadana liczba epok 
siec_newff.trainParam.goal = 0; %  docelowy błąd 

siec_newff = train(siec_newff,X,y);

ynn2 = sim(siec_newff,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,3);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newff test data, mse: ', num2str(test_error),' neuron count = 50'])

%% LICZBA NEURONOW = 75
liczba_n_h1 = 75; 
liczba_n_o = 1; 

siec_newff = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec_newff.trainParam.epochs = 700; % zadana liczba epok 
siec_newff.trainParam.goal = 0; %  docelowy błąd 

siec_newff = train(siec_newff,X,y);

ynn2 = sim(siec_newff,Xt);
test_error = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(1)
subplot(1,4,4);grid;hold;box;
plot(y,'m')
plot(ynn2,'g')
legend('target output','neural network output')
title(['newff test data, mse: ', num2str(test_error),' neuron count = 75'])