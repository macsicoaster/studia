clear all
close all
clc
warning off

% można porobic scrreny macierzy aby pokazac zmiane danych
%% stworzenie zesatwu danych treningowych
% kodowanie cyfry 0
A = [0 1 1 1 0;
     1 0 0 0 1;
     1 0 0 0 1;
     1 0 0 0 1;
     0 1 1 1 0];

a = A(:)';
in_data_train = a;
out_data_train = [0];


% kodowanie 1
A = [0 0 1 0 0;
     0 1 1 0 0;
     1 0 1 0 0;
     0 0 1 0 0;
     0 0 1 0 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 1];

% kodowanie 2
A = [0 0 1 1 0;
     0 1 0 0 1;
     0 0 0 1 0;
     0 0 1 0 0;
     0 1 1 1 1];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 2];


% kodowanie 3
A = [0 1 1 1 0;
     0 0 0 1 0;
     0 1 1 1 0;
     0 0 0 1 0;
     0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 3];

%kodowanie 4

A = [0 1 0 0 0;
     0 1 0 1 0;
     0 1 1 1 1;
     0 0 0 1 0;
     0 0 0 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 4];

% kodowanie 5
A = [0 1 1 1 1;
     0 1 0 0 0;
     0 1 1 1 0;
     0 0 0 0 1;
     0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 5];


% kodowanie 6
A = [0 1 1 1 1;
     0 1 0 0 0;
     0 1 1 1 0;
     0 1 0 0 1;
     0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 6];

% kodowanie 7
A = [0 1 1 1 1;
     0 0 0 0 1;
     0 0 0 1 0;
     0 0 1 0 0;
     0 1 0 0 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 7];


% kodowanie 8
A = [0 1 1 1 0;
     1 0 0 0 1;
     0 1 1 1 0;
     1 0 0 0 1;
     0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 8];


% kodowanie 9
A = [0 1 1 1 0;
     1 0 0 0 1;
     0 1 1 1 1;
     0 0 0 0 1;
     0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 9];

%% stworzenie danych testowych

% kodowanie cyfry 0
A = [0 1 1 1 0;
     0 1 0 0 1;
     1 0 0 0 1;
     1 0 0 0 1;
     0 1 1 1 0];

b = A(:)';
in_data_test = b;
out_data_test = [0];


% kodowanie 1
A = [0 0 1 0 0;
     0 1 1 0 0;
     0 0 1 0 0;
     0 0 1 0 0;
     0 0 1 0 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 1];

% kodowanie 2
A = [0 0 1 1 0;
     0 1 0 0 1;
     0 0 0 1 0;
     0 0 1 0 0;
     0 1 1 1 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 2];


% kodowanie 3
A = [0 1 1 1 0;
     0 0 0 1 0;
     0 0 1 1 0;
     0 0 0 1 0;
     0 1 1 1 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 3];

%kodowanie 4

A = [0 1 0 1 0;
     0 1 0 1 0;
     0 1 1 1 1;
     0 0 0 1 0;
     0 0 0 1 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 4];

% kodowanie 5
A = [0 1 1 1 1;
     1 0 0 0 0;
     0 1 1 1 0;
     0 0 0 0 1;
     0 1 1 1 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 5];


% kodowanie 6
A = [0 1 1 1 1;
     0 1 0 0 0;
     0 1 1 1 0;
     0 1 0 0 1;
     0 1 1 1 1];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 6];

% kodowanie 7
A = [0 1 1 1 1;
     0 0 0 0 1;
     0 0 0 1 0;
     0 0 1 0 0;
     0 0 0 0 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 7];


% kodowanie 8
A = [1 1 1 1 0;
     1 0 0 0 1;
     0 1 1 1 0;
     1 0 0 0 1;
     0 1 1 1 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 8];


% kodowanie 9
A = [0 1 1 1 0;
     1 0 0 0 1;
     0 1 1 1 1;
     0 0 0 0 1;
     1 1 1 1 0];

b = A(:)';
in_data_test = [in_data_test; b];
out_data_test = [out_data_test; 9];

%% stworzenie sieci NEWFF


zakres = [0 1];
liczba_n_h1 = 5;
liczba_n_h2 = 6;
liczba_n_o = 1;
% ma byc 25 razy zapisany zakres w new ff

newff = newff([zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres] ,[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', 'tansig', 'purelin'},'trainlm');
newff.trainParam.epochs = 500;
newff.trainParam.goal = 1e-5;

siec_ff = train(newff, in_data_train', out_data_train');
wynik_ff = sim(siec_ff, in_data_train');   
test_wynik_ff = sim(siec_ff,in_data_test');
mse_train_ff = mse(out_data_train, wynik_ff');
mse_test_ff = mse(out_data_test, test_wynik_ff');

figure(1)
subplot(1,2,1);grid;box;hold;
plot(out_data_train,'*m');
plot(wynik_ff','om');
legend('training data','output data');
title(['handwritng recognition on training dataset newff mse: ', num2str(mse_train_ff)]);

subplot(1,2,2);grid;box;hold;
plot(out_data_test,'*m');
plot(test_wynik_ff','om');
legend('test data','output data');
title(['handwriting recognition on test dataset newff mse: ', num2str(mse_test_ff)]);

%% stworzenie sieci NEWELM

siec_elm = newelm([zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres;  zakres; zakres; zakres; zakres; zakres] ,[liczba_n_h1 liczba_n_h2 liczba_n_o],{'tansig', 'tansig', 'purelin'},'trainlm');
siec_elm.trainParam.epochs = 500;
siec_elm.trainParam.goal = 1e-7;

siec_elm = train(siec_elm,in_data_train', out_data_train' );   
test_wynik_elm = sim(siec_elm,in_data_test');
wynik_elm = sim(siec_elm, in_data_train');
mse_train_elm = mse(out_data_train, wynik_elm');
mse_test_elm = mse(out_data_test, test_wynik_elm');

figure(2)
subplot(1,2,1);grid;box;hold;
plot(out_data_train,'*m');
plot(wynik_elm,'om');
legend('training data','output data');
title(['handwritng recognition on training dataset newelm mse: ', num2str(mse_train_ff)]);

subplot(1,2,2);grid;box;hold;
plot(out_data_test,'*m');
plot(test_wynik_elm','om');
legend('test data','output data');
title(['handwriting recognition on test dataset newelm mse: ', num2str(mse_test_ff)]);

%% siec radialna newrb
MN = 50;
DF = 5;
GOAL = 0;
SPREAD = 0.5;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(4);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])


%% model dostosowany do danych
SPREAD = 0.5; 
NN_model_rbf2 = newrbe(in_data_train',out_data_train',SPREAD);
y_rbe = sim(NN_model_rbf2,in_data_train');
yt_rbe = sim(NN_model_rbf2,in_data_test');
input_mse_rbe = mse(out_data_train,y_rbe'); 
test_mse_rbe = mse(out_data_train, yt_rbe'); 

figure(5);grid;hold;box;
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rbe,'ob')
legend('test data','output data')
title(['newrbe test data, mse: ', num2str(test_mse_rbe)])
view(NN_model_rbf2)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rbe,'ob')
legend('training data','output data')
title(['newrbe training data, mse: ', num2str(input_mse_rbe)])

