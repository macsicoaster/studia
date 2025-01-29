clear all %#ok
close all
clc

warning off

opt = optimoptions('particleswarm','PlotFcn',@pswplotbestf);
opt.MaxIterations = 5;
opt.SwarmSize = 10;
%%
%[wartosci_wyznaczone] = ga(@cost_fun,1,[],[],[],[],[-5],[5],[],opt);
wartosci_obliczone = particleswarm(@cost_fun,1,-5,5,opt);
%%
x = -10:0.1:10;
y = cost_fun(x);
figure(2)
plot(x,y,'LineWidth',2);grid;xlabel('x');ylabel('y');hold;
qy = -50:0.1:50;
qx = ones(size(qy))*wartosci_obliczone;
plot(wartosci_obliczone,cost_fun(wartosci_obliczone),'xr','MarkerSize',7,'LineWidth',3);