clear all %#ok
close all
clc

%% dane wejściowe
x = -10:0.1:10;
x1 = x(1:length(x)-1);
x2 = x(2:length(x));
X = [x1;x2];
y = sin(x1);

figure(1);grid;hold;box on;
plot(y,'m');
plot(x1,'r');
plot(x2,'g');
title('Training data');

%% my definiujemy model
MN = 50; % maksymalna ilość neuronów
DF = 5; % częstotliwość odświeżania informacji podczas uczenia
GOAL = 0; % akceptowalny błąd
SPREAD = 0.5; % spłaszczenie rozkładu normalnego
NN_model_rbf = newrb(X,y,GOAL,SPREAD,MN,DF);

Xt = X + (randn(size(X))*0.05);
ynn = sim(NN_model_rbf,X);
ynn2 = sim(NN_model_rbf,Xt);

input_mse_rb = mse(y,ynn); % błąd przy symulacji sieci na danych treningowych
test_error_rb = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(2);grid;hold;box;
subplot(2,1,2);grid;hold;box;
plot(y,'m','LineWidth',1)
plot(ynn2,'b','LineWidth',1)
legend('y','przyblizenie y')
title(['Newrb test data, mse: ' num2str(test_error_rb)])


subplot(2,1,1);grid;hold;box;
plot(y,'m','LineWidth',1)
plot(ynn,'b','LineWidth',1)
legend('y','przyblizenie y')
title(['Newrb taining data, mse: ' num2str(input_mse_rb)])
view(NN_model_rbf)



%% model dostosowuje się do danych
SPREAD = 0.7; % coś z rokładem normalnym rozszerzenie 
NN_model_rbf2 = newrbe(X,y,SPREAD);

Xt = X + (randn(size(X))*0.05);
ynn = sim(NN_model_rbf2,X);
ynn2 = sim(NN_model_rbf2,Xt);
input_mse_rbe = mse(y,ynn); % błąd przy symulacji sieci na danych treningowych
test_error_rbe = mse(y, ynn2); % błąd przy symulacji na danych z szumami

figure(3);
subplot(2,1,2);grid;hold;box;
plot(y,'m','LineWidth',1)
plot(ynn2,'b','LineWidth',1)
legend('y','przyblizenie y')
title(['Newrbe test data, mse: ' num2str(test_error_rbe)])

subplot(2,1,1);grid;hold;box;
plot(y,'m','LineWidth',1)
plot(ynn,'b','LineWidth',1)
legend('y','przyblizenie y')
title(['Newrbe taining data, mse: ' num2str(input_mse_rbe)])

view(NN_model_rbf2)
