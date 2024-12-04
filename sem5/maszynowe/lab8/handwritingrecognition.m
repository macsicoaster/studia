clear all
close all
warning off
clc

%% 
% kodowanie znaku
%xxxxx
%xxxxx
%xxxxx
%xxxxx
%xxxxx

A = [0 1 1 1 0;
     1 0 0 0 1;
     1 0 0 0 1;
     1 0 0 0 1;
     0 1 1 1 0];

a = A(:)';
in_data_training = a;
out_data_training = [0];
%%
A = [0 0 0 1 0;
    0 0 1 1 0;
    0 1 0 1 0;
    0 0 0 1 0;
    0 0 0 1 0];

a = A(:)';
in_data_training = [in_data_training; a];
out_data_training = [out_data_training; 1];

A = [0 0 1 1 0;
    0 1 0 0 1;
    0 0 0 1 0;
    0 0 1 0 0;
    0 1 1 1 1];

a = A(:)';
in_data_training = [in_data_training; a];
out_data_training = [out_data_training; 2];

%% newff
zakres = [0,1];
liczba_n_h1 = 5;
liczba_n_h2 = 5;
liczba_n_o = 1;
siec = newff(zakres, in_data_training, out_data_training, [liczba_n_h1, liczba_n_h2], {'tansig', 'tansig', 'purelin'}, 'trainlm');
siec.trainParam.epochs = 1000;
siec.trainParam.goal = 0.01;
siec = train(siec, in_data_training, out_data_training);

%%
figure(1)

