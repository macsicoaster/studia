clear all %#ok
close all
clc
%%
x1 = rand(300,2)*10;
x2 = x1+sin(x1)*100;
X = [x1; x2];

figure(1);grid;hold;box;xlabel('x1');ylabel('x2');title('Dane wejsciowe');

for i=1:size(X,1)
    plot(X(i,1),X(i,2),'*');
end

k = 2;

[idx,C,sumd,D] = kmeans(X,k);
clust_number = idx;
centers_coordinates = C;

C = clust_number;
figure(3);grid;hold;box;xlabel('x1');ylabel('x2');title('Dane pogrupowane');

for i=1:size(C,1)
    if C(i) == 1
        plot(X(i,1),X(i,2),'r*');
    elseif C(i) == 2
        plot(X(i,1),X(i,2),'b*');
    elseif C(i) == 3
        plot(X(i,1),X(i,2),'g*');
    elseif C(i) == 4
        plot(X(i,1),X(i,2),'y*');
    elseif C(i) == 5
        plot(X(i,1),X(i,2),'m*');
    elseif C(i) == 6
        plot(X(i,1),X(i,2),'c*');
    elseif C(i) == 7
        plot(X(i,1),X(i,2),'k*');
    else
        plot(X(i,1),X(i,2),'w*','Color',[0.1*(C(i)/max(C)+0.1) 0.5*(C(i)/max(C)+0.1) 0.9*(C(i)/max(C)+0.1)]);
    end
end

figure(4);grid;hold;box;xlabel('x1');ylabel('x2');title('Centra grup');
plot(centers_coordinates(1,1),centers_coordinates(1,2),'Xk','MarkerSize',20);
plot(centers_coordinates(2,1),centers_coordinates(2,2),'Xk','MarkerSize',20);