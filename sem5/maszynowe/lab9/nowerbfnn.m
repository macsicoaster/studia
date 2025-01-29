x = -10:0.1:10;
x1 = (1+cos(x)).*(1-sin(x));
y = (1+sin(x1)).*(1-sin(x1));


figure(1);
grid;hold;plot(y,'g')

%% RBFNN
MN = 50; % liczba neuronow w warstwie ukrytej
DF = 5; % wspolczynnik uczenia, czestotliwosc odswiezania informacji na temat uczenia
GOAL = 0; % celowy blad
SPREAD = 0.5; % rozrzut funkcji radialnych
NN_model_rbf = newrb(x1,y,GOAL,SPREAD,MN,DF);
view(NN_model_rbf)

xt = x1+(randn(size(x1))*0.05);
ynn = sim(NN_model_rbf,xt);

figure(2);
plot(ynn,'r');grid;hold;plot(y,'g')