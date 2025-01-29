clear all
close all
clc
%%
data1 = -10:0.1:10;
data2 = sin(data1);
data3 = sin(data1);
data4 = sin(data1);
data5 = sin(data1);

data1 = data1';
data2 = data2';
data3 = data3';
data4 = data4';
data5 = data5';

data = [data2 data3 data4 data5];

figure(1)
plot(data, 'MarkerSize', 7, 'LineWidth', 3); grid; hold;
xlabel('x'); ylabel('y');title('initial data');

data_n = data;
n_coeff = 0.1;
data_n = data_n+(n_coeff*randn(size(data)));

figure(2)
plot(data_n,'MarkerSize',7,'LineWidth',3);grid;hold;
xlabel('x');ylabel('y');title('initial data with noise');

max_components = size(data_n,2);
num_components = max_components-3;
[coeff,score,latent,tsquared,explained,mu] = pca(data_n,'NumComponents',1);
data_pca = score*coeff'+mu;

figure(3)
plot(data_pca,'MarkerSize',7,'LineWidth',3);grid;hold;
xlabel('x');ylabel('y');title('pca filtering');