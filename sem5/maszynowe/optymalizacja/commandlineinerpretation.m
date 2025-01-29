clc
clear all
close all
warning off
global kp ti

opt = optimoptions('ga','PlotFcn',@gaplotbestf);
opt.MaxGenerations = 5;
opt.PopulationSize = 10;
[wartosci_wyznaczone,wartosc_f] = ga(@flc_error_ffunc,2,[],[],[],[],[1,1],[100,100],[],opt);