clear all
close all
clc

x = linspace(0,10,201);
x1 = x(1:200);
x2 = x(2:201);
a1 = 1;
y1 = a1 * x1;
y2 = a1 * x2;

X1=[y1; y2];

n = 199;
x0 = 1;
y0 = 1;

a = 1.4;
b = 0.3;

syms x y;
fx = @(x,y)(y + 1 - a*x.^2);
fy = @(x)(b*x);

X = zeros(1,n);
Y = zeros(1,n);

X(1,1) = fx(x0,y0);
Y(1,1) = fy(x0);

for i=1:n
    X(1,i+1) = fx(X(1,i),Y(1,i));  
    Y(1,i+1) = fy(X(1,i));
end

figure(1)
plot(X,Y,'*')

zakres = [-20 20];
liczba_n_h1 = 30;
liczba_n_o = 1;

siec = newff([zakres;zakres],[liczba_n_h1 liczba_n_o],{'tansig','purelin'},'trainlm');
siec.trainParam.epochs = 100;
siec.trainParam.goal = 1e-5;
siec=train(siec,X1,fy(x1)); %tu podstawic rozwazana funkcje
ynn=sim(siec,X1);

figure(2)
plot(fx(x1,y1)),hold on, grid on %tu podstawic rozwazana funkcje
plot(ynn)
legend('fx','ynn')