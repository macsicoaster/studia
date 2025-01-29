clear all %#ok
close all
clc
x = 0:0.1:10;
x1 = x(1:length(x)-2);
x2 = x(2:length(x)-1);
x3 = x(3:length(x));
X = [x1;x2;x3];
y = exp(sin(x1)+0.1*sin(5*x1));
Xt = X + (randn(size(X))*0.05);

% wykres z danymi wejściowymi
figure(1);grid;hold;box on;
plot(X')
plot(y,'m');
title('Training data');
legend('input vector 1', 'input vector 2', 'input vector 3', 'targeted output')

zakres = [-20 20];

%% kierunkowa
liczba_n_h1 = 15; 
liczba_n_h2 = 15; 
liczba_n_o = 1; 

siec_newff = newff([zakres; zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');

siec_newff.trainParam.epochs = 700; % zadana liczba epok 
siec_newff.trainParam.goal = 0; %  docelowy błąd 

siec_newff = train(siec_newff,X,y);


y_newff = sim(siec_newff,X);
yt_newff = sim(siec_newff,Xt);

input_mse_newff = mse(y,y_newff); % błąd przy symulacji sieci na danych treningowych
test_mse_newff = mse(y, yt_newff); % błąd przy symulacji na danych z szumami

figure(2);
subplot(2,1,2);hold;grid; box;
plot(y,'m');
plot(yt_newff,'g');
title(['newff test data, mse: ', num2str(test_mse_newff)])
legend('targeted result', 'neural network result')

subplot(2,1,1);grid,hold,box;
plot(y,'m');
plot(y_newff,'g');
title(['newff training data, mse: ', num2str(input_mse_newff)])
legend('targeted result', 'neural network result')

%% rekurencyjna
siec_rec = newelm([zakres; zakres; zakres],[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', ...
    'tansig', 'purelin'},'trainlm');
siec_rec.trainParam.epochs = 700; % zadana liczba epok 
siec_rec.trainParam.goal = 0;

siec_rec = train(siec_newff,X,y);

y_rec = sim(siec_rec,X);
yt_rec = sim(siec_rec,Xt);

input_mse_rec = mse(y,y_rec); % błąd przy symulacji sieci na danych treningowych
test_mse_rec = mse(y, yt_rec); % błąd przy symulacji na danych z szumami

figure(3);
subplot(2,1,2);hold;grid; box;
plot(y,'m');
plot(yt_rec,'g');
title(['newelm test data, mse: ', num2str(input_mse_rec)]);
legend('targeted result', 'neural network result')

subplot(2,1,1);hold;grid; box;
plot(y,'m');
plot(y_rec,'g');
title(['newelm training data, mse: ', num2str(input_mse_rec)]);
legend('targeted result', 'neural network result')


%% radialna

% model defioniowany przez nas
MN = 50; 
DF = 5; 
GOAL = 0; 
SPREAD = 0.5; % spłaszczenie rozkładu normalnego
NN_model_rbf = newrb(X,y,GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,X);
yt_rb= sim(NN_model_rbf,Xt);

input_mse_rb = mse(y,y_rb); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(y, yt_rb); % błąd przy symulacji na danych z szumami

figure(4);
subplot(2,1,2);grid;hold;box;
plot(y,'m')
plot(yt_rb,'b')
legend('y','przyblizenie y')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(y,'m')
plot(y_rb,'b')
legend('y','przyblizenie y')
title(['newrb training data, mse: ', num2str(input_mse_rb)])


% model dostosowuje sie do danych
NN_model_rbf2 = newrbe(X,y,SPREAD);

y_rbe = sim(NN_model_rbf2,X);
yt_rbe = sim(NN_model_rbf2,Xt);
input_mse_rbe = mse(y,y_rbe); % błąd przy symulacji sieci na danych treningowych
test_mse_rbe = mse(y, yt_rbe); % błąd przy symulacji na danych z szumami

figure(5);grid;hold;box;
subplot(2,1,2);grid;hold;box;
plot(y,'m')
plot(yt_rbe,'b')
legend('y','przyblizenie y')
title(['newrbe test data, mse: ', num2str(test_mse_rbe)])
view(NN_model_rbf2)

subplot(2,1,1);grid;hold;box;
plot(y,'m')
plot(y_rbe,'b')
legend('y','przyblizenie y')
title(['newrbe training data, mse: ', num2str(input_mse_rbe)])

