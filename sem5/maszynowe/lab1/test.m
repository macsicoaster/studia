clear all
%close all
%clc %czyszczenie
%%
%dir
%ls %to samo - wyswietla pliki w sciezce
%who
%whos %wyswietla dane o zmiennych
%help save
a = 1;
c=a+1;
disp('wartosc:')
disp(c)
%%
% q="wprowadz wartosc:"
% q1 = input(q); %wpisz wartosc zmiennej w command window
% q2 = q1 + 3;
% disp('obliczona wartosc:')
% disp(q2)
%% MACIERZE

A = [1 2 3;4 5 6;7 8 9]
B = [1 2 3;4 5 6;7 8 9]

A = zeros(3,3)
B = ones(3,3)
C = eye(3,3) % jedynki na skos, reszta 0
D = rand(3,3)
E = randn(3,3)
F = diag(E)
G = magic(3) % suma w każdą stronę = 15

H = [A A] %a obok a
I = [A;A] %a pod a
%% ELEMENTY GRAFICZNE
x = -10:0.1:10;
y = sin(x);

figure(1)
plot(x,y,'m');
grid on
hold on
box on
xlabel('\alpha');
ylabel('\theta');
plot(x, y+1, 'k')
plot(x, y+2, 'g*')
axis([-5 10 -1 5])

%legend('\alpha=1, '\alpha=2', '\alpha=0.2', 'FontSize',12)
title('test - plot 2D', 'FontSize', 17)

figure(2)

subplot(3,2,1)
plot(x,y,'r');grid;xlabel('x');ylabel('y');

subplot(3,2,2)
plot(x,y.^2,'g');grid;xlabel('x');ylabel('y');

subplot(3,2,3)
plot(x,y*pi,'b');grid;xlabel('x');ylabel('y');

subplot(3,2,4)
plot(x,sin(y),'c');grid;xlabel('x');ylabel('y');

subplot(3,2,5)
plot(x,cos(y),'m');grid;xlabel('x');ylabel('y');

subplot(3,2,6)
plot(x,tan(y),'k');grid;xlabel('x');ylabel('y');

%% PĘTLE
%for i=1:size(y,2)
    %if i(1,i) == 0
        ...
    %elseif y(1,i)>0.7
        ...
    %else
        ...
    %end
%end 