clear all; close all; clc; warning off %#ok

%PSO, GA

cost_fun_3 = @(x) [(x(1).*exp(-(sin(x(1)).^2+x(2).^2)))];

opt = optimoptions('particleswarm','PlotFcn',@pswplotbestf);
opt.MaxIterations = 5;
opt.SwarmSize = 10;
wartosci_obliczone = particleswarm(cost_fun_3,2,[-5,-5],[5,5],opt);
figure(2)
fsurf(@(x1,x2)x1.*exp(-(sin(x1).^2+x2.^2)));grid on; hold on; box

cost_fun_3([wartosci_obliczone(1) wartosci_obliczone(2)])
plot3(wartosci_obliczone(1),wartosci_obliczone(2),cost_fun_3([wartosci_obliczone(1),wartosci_obliczone(2)]),'xr','MarkerSize',7,'LineWidth',3);