clear all
close all
clc
x=-10:0.1:10;
y=sin(x);

hiddenSize = 35;
autoenc = trainAutoencoder(y,hiddenSize,'EncoderTransferFunction','logsig','DecoderTransferFunction','purelin','MaxEpochs',200);

a=0;
yt = y+(a*randn(size(y)));
ye = predict(autoenc,yt);

figure(5)
plot(ye,'r');grid on;hold on;plot(yt,'b');legend('autoencoder','data')

figure(6)
plot(ye,'r');grid on;hold on;plot(yt,'b');legend('autoencoder','data')

a=0.1;
yt=y+(a*randn(size(y)));
ye = predict(autoenc,yt);

figure(7)
plot(ye,'r');grid on;hold on;plot(yt,'b');legend('autoencoder','data')