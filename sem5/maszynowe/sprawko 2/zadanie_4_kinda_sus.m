clear all %#ok
close all
clc
x1 = [0 0 1 1];
x2 = [0 1 0 1];
X = [x1; x2];
y = [0 1 1 0];

% wykres z danymi wejściowymi
figure(1);grid;hold;box on;
plot(X', '*')
plot(y,'om');
title('Training data');
legend('input vector 1', 'input vector 2', 'target output')

zakres = [-20 20];

%% kierunkowa
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 

siec_newff = newff([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec_newff.trainParam.epochs = 700; % zadana liczba epok 
siec_newff.trainParam.goal = 0; %  docelowy błąd 

siec_newff = train(siec_newff,X,y);


y_newff = sim(siec_newff,X);

input_mse_newff = mse(y,y_newff); % błąd przy symulacji sieci na danych treningowych

figure(2);hold;grid; box on;
plot(y,'*m');
plot(y_newff,'og');
title(['newff training data, mse: ', num2str(input_mse_newff)]);
legend('targeted result', 'neural network result')



%% rekurencyjna
siec_rec = newelm([zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');
siec_rec.trainParam.epochs = 700; % zadana liczba epok 
siec_rec.trainParam.goal = 0;

siec_rec = train(siec_newff,X,y);

y_rec = sim(siec_rec,X);
input_mse_elm = mse(y,y_rec)

figure(3);hold;grid; box on;
plot(y,'*m');
plot(y_rec,'og');
title(['newelm training data, mse: ', num2str(input_mse_elm)]);
legend('targeted result', 'neural network result')



%% radialna

% model defioniowany przez nas
MN = 50; 
DF = 5; 
GOAL = 0; 
SPREAD = 0.5; % spłaszczenie rozkładu normalnego
NN_model_rbf = newrb(X,y,GOAL,SPREAD,MN,DF);


y_rb = sim(NN_model_rbf,X);
input_mse_rb = mse(y,y_rb);
figure(4);grid;hold;box;
plot(y,'*m')
plot(y_rb,'ob')
legend('y','przyblizenie y')
title(['newrb training data, mse: ', num2str(input_mse_rb)]);
view(NN_model_rbf)



% model dostosowuje sie do danych
NN_model_rbf2 = newrbe(X,y,SPREAD);

Xt = X + (randn(size(X))*0.05);
y_rbe = sim(NN_model_rbf2,X);


input_mse_rbe = mse(y,y_rbe); % błąd przy symulacji sieci na danych treningowych
figure(5);grid;hold;box;
plot(y,'*m')
plot(y_rbe,'ob')
legend('y','przyblizenie y')
title(['newrbe training data, mse: ', num2str(input_mse_rbe)])
view(NN_model_rbf2)


