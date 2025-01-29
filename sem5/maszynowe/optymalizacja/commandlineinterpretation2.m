kp = wartosci_wyznaczone(1);
ti = wartosci_wyznaczone(2);
sim('pi_control')
figure(7)
plot(t,omega,'r')
xlabel('t[s]')
ylabel('\omega [p.u.]')
legend('init','optim')

clc
opt