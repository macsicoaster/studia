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
%%  ROZRZUT = 0.05
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.05;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_0001 = mse(out_data_train,yt_rb'); % błąd przy symulacji sieci na danych treningowych


figure(1);
subplot(1,4,1);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_0001),' spread = ', num2str(SPREAD) ])
%view(NN_model_rbf)



%% ROZRZUT = 0.1
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_01 = mse(out_data_train,yt_rb');


figure(1)
subplot(1,4,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_01),' spread = ', num2str(SPREAD)])
%view(NN_model_rbf)



%% ROZRZUT = 0.5
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.5;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_0_1 = mse(out_data_train,yt_rb'); % błąd przy symulacji sieci na danych treningowych


figure(1);
subplot(1,4,3);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_0_1),' spread = ', num2str(SPREAD) ])
%view(NN_model_rbf)

%% ROZRZUT = 1
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 1;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_1 = mse(out_data_train,yt_rb'); % błąd przy symulacji sieci na danych treningowych


figure(1);
subplot(1,4,4);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_1),' spread = ', num2str(SPREAD) ])
%view(NN_model_rbf)


%% 1 NEURON 
MN = 1;
DF = 1;
GOAL = 0;
SPREAD = 0.5;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_0001 = mse(out_data_train,yt_rb'); % błąd przy symulacji sieci na danych treningowych


figure(2);
subplot(1,3,1);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_0001),' MN = ', num2str(MN) ])
%view(NN_model_rbf)



%% 5 NEURON 
MN = 5;
DF = 1;
GOAL = 0;
SPREAD = 0.5;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_01 = mse(out_data_train,yt_rb');


figure(2)
subplot(1,3,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_01),' MN = ', num2str(MN)])
%view(NN_model_rbf)



%% 10 NEURON ROZRZUT = 0.1
MN = 10;
DF = 1;
GOAL = 0;
SPREAD = 0.5;
NN_model_rbf = newrb(in_data_train',out_data_train',GOAL,SPREAD,MN,DF);

yt_rb = sim(NN_model_rbf,in_data_test');
mse_spr_0_1 = mse(out_data_train,yt_rb'); % błąd przy symulacji sieci na danych treningowych


figure(2);
subplot(1,3,3);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrb test data, mse: ', num2str(mse_spr_0_1),' MN = ', num2str(MN) ])
%view(NN_model_rbf)



