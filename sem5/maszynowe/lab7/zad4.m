clear all %#ok
close all
clc

wartosci_poczatkowe = [-5 5 25];
zakres = [0 5];
[t, wartosci_ukladu] = ode23(@ukladlorenza, zakres, wartosci_poczatkowe);

% Move this function to the end of the file

in_data_train = [t(1:length(t)-2),t(2:length(t)-1),t(3:length(t))];
out_data_train = [wartosci_ukladu(1:length(wartosci_ukladu)-2,1)];

figure(1)
plot(t,wartosci_ukladu(:,1),'r');grid;hold;

figure(2)
plot3(wartosci_ukladu(:,1),wartosci_ukladu(:,2),wartosci_ukladu(:,3),'r');grid;hold;

%% feedforwardnet datatrain

liczba_n_h1 = 12;
liczba_n_h2 = 15;

NN_model = feedforwardnet([liczba_n_h1 liczba_n_h2]);
NN_model.trainParam.epochs = 1500;
NN_model.trainParam.goal = 1e-5;

NN_model = train(NN_model,in_data_train',out_data_train');
view(NN_model);

ynn = sim(NN_model,in_data_train');

figure(3)
plot(ynn);grid;hold;
plot(out_data_train,'r');title('feedforwardnet');

%% feedforwardnet w 3d

liczba_n_h1 = 12;
liczba_n_h2 = 15;
liczba_n_h3 = 18;

NN_model = feedforwardnet([liczba_n_h1 liczba_n_h2 liczba_n_h3]);
NN_model.trainParam.epochs = 1500;
NN_model.trainParam.goal = 1e-5;

NN_model = train(NN_model, wartosci_ukladu(:,1:2)', wartosci_ukladu(:,3)');
view(NN_model);

ynn = sim(NN_model,wartosci_ukladu(:,1:2)');

figure(4)
plot3(wartosci_ukladu(:,1),ynn,wartosci_ukladu(:,3));grid;hold;
plot3(wartosci_ukladu(:,1),wartosci_ukladu(:,2),wartosci_ukladu(:,3),'r');
title('feedforwardnet 3d');

function y = ukladlorenza(t, f)
    s = 10;
    b = 3;
    r = 28;
    y = [s*f(2)-s*f(1);r*f(1)-f(1)-f(1)*f(3)-f(2);f(1)*f(2)-b*f(3)];
end