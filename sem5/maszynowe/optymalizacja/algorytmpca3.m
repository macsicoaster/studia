clear all
close all
clc

data = imread('flamingos.jpg');
figure(1)
imshow(data);
title('Original Image');

data_c_red = data(:,:,1);
data_c_red = double(data_c_red);

data_c_green = data(:,:,2);
data_c_green = double(data_c_green);

data_c_blue = data(:,:,3);
data_c_blue = double(data_c_blue);

max_components = size(data_c_blue,2);
num_components = max_components-1185;

%pca for red
[coeff,score,latent,tsquared,explained,mu] = pca(data_c_red,'NumComponents',num_components);
data_pca_c_red = score*coeff'+mu;
data_pca_c_red = uint8(data_pca_c_red);
s1=size(score,1)*size(score,2);
s2=size(coeff,1)*size(coeff,2);
s3=size(mu,1)*size(mu,2);
s_pca1= s1+s2+s3;

%pca for green
[coeff,score,latent,tsquared,explained,mu] = pca(data_c_green,'NumComponents',num_components);
data_pca_c_green = score*coeff'+mu;
data_pca_c_green = uint8(data_pca_c_green);
s1=size(score,1)*size(score,2);
s2=size(coeff,1)*size(coeff,2);
s3=size(mu,1)*size(mu,2);
s_pca2= s1+s2+s3;

%pca for blue
[coeff,score,latent,tsquared,explained,mu] = pca(data_c_blue,'NumComponents',num_components);
data_pca_c_blue = score*coeff'+mu;
data_pca_c_blue = uint8(data_pca_c_blue);
s1=size(score,1)*size(score,2);
s2=size(coeff,1)*size(coeff,2);
s3=size(mu,1)*size(mu,2);
s_pca3= s1+s2+s3;

data_pca_final = cat(3,data_pca_c_red,data_pca_c_green,data_pca_c_blue);
figure(2)
imshow(data_pca_final);
title('PCA Image');

imwrite(data_pca_final,'flamingos_pca.jpg','jpg');

Q = double(data);
