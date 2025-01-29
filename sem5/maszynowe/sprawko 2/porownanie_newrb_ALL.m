clear all
close all
clc
warning off
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
%% 1 NEURON ROZRZUT = 0.001
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.001;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(1);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 1 NEURON ROZRZUT = 0.01
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.01;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(2);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 1 NEURON ROZRZUT = 0.1
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(3);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 1 NEURON ROZRZUT = 1
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 1;
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
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 2 NEURONY ROZRZUT = 0.001
MN = 2;
DF = 1;
GOAL = 0;
SPREAD = 0.001;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(5);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 2 NEURONY ROZRZUT = 0.01
MN = 2;
DF = 1;
GOAL = 0;
SPREAD = 0.01;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(6);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 2 NEURONY ROZRZUT = 0.1
MN = 2;
DF = 1;
GOAL = 0;
SPREAD = 0.1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(7);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 2 NEURON ROZRZUT = 1
MN = 2;
DF = 1;
GOAL = 0;
SPREAD = 1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(8);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 5 NEURONOW ROZRZUT = 0.001
MN = 5;
DF = 1;
GOAL = 0;
SPREAD = 0.001;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(9);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 5 NEURONY ROZRZUT = 0.01
MN = 5;
DF = 1;
GOAL = 0;
SPREAD = 0.01;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(10);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 5 NEURONOW ROZRZUT = 0.1
MN = 5;
DF = 1;
GOAL = 0;
SPREAD = 0.1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(11);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])

%% 5 NEURONOW ROZRZUT = 1
MN = 5;
DF = 1;
GOAL = 0;
SPREAD = 1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

y_rb = sim(NN_model_rbf,in_data_train');
yt_rb = sim(NN_model_rbf,in_data_test');
input_mse_rb = mse(out_data_train,y_rb'); % błąd przy symulacji sieci na danych treningowych
test_mse_rb = mse(out_data_train, yt_rb');


figure(12);
subplot(2,1,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(test_mse_rb)])
%view(NN_model_rbf)

subplot(2,1,1);grid;hold;box;
plot(out_data_test,'*m')
plot(y_rb,'ob')
legend('training data','output data')
title(['newrb training data, mse: ', num2str(input_mse_rb)])