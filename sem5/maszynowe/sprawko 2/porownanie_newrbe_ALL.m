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
%%  ROZRZUT = 0.8
SPREAD = 0.8;
NN_model_rbf2 = newrbe(in_data_train',out_data_train',SPREAD);

yt_rb = sim(NN_model_rbf2,in_data_test');
mse_spr = mse(out_data_train,yt_rb');

figure(1);
subplot(1,4,1);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrbe test data, mse: ', num2str(mse_spr),' spread = ', num2str(SPREAD) ])

%%  ROZRZUT = 0.4
SPREAD = 0.4;
NN_model_rbf2 = newrbe(in_data_train',out_data_train',SPREAD);

yt_rb = sim(NN_model_rbf2,in_data_test');
mse_spr = mse(out_data_train,yt_rb');

figure(1);
subplot(1,4,2);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrbe test data, mse: ', num2str(mse_spr),' spread = ', num2str(SPREAD) ])

%%  ROZRZUT = 0.2
SPREAD = 0.2;
NN_model_rbf2 = newrbe(in_data_train',out_data_train',SPREAD);

yt_rb = sim(NN_model_rbf2,in_data_test');
mse_spr = mse(out_data_train,yt_rb');

figure(1);
subplot(1,4,3);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrbe test data, mse: ', num2str(mse_spr),' spread = ', num2str(SPREAD) ])

%%  ROZRZUT = 1
SPREAD = 1;
NN_model_rbf2 = newrbe(in_data_train',out_data_train',SPREAD);

yt_rb = sim(NN_model_rbf2,in_data_test');
mse_spr = mse(out_data_train,yt_rb');

figure(1);
subplot(1,4,4);grid;hold;box;
plot(out_data_train,'*m')
plot(yt_rb,'ob')
legend('test data','output data')
title(['newrbe test data, mse: ', num2str(mse_spr),' spread = ', num2str(SPREAD) ])