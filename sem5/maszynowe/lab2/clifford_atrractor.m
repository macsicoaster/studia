clear all
close all
clc

a = -1.4;
b = 1.6;
c = 1;
d = 0.73;

X = [];
Y = [];
n = 1e7;
x = 0;
y = 0;

for i = 1:n
    xn = sin(a * y) + c * cos(a * x);
    yn = sin(b * x) + d * cos(b * y);

    X(i) = xn;
    Y(i) = yn;

    x = xn;
    y = yn;

    % X = [X x];
    % Y = [Y y];
end

X = X + abs(min(X)) + 0.01;
Y = Y + abs(min(Y)) + 0.01;

X = X ./ max(X);
Y = Y ./ max(Y);

h = 500;
w = 700;
Q = zeros(h, w);

for i = 1:n
    q1 = round(h * X(i));
    q2 = round(w * Y(i));
    Q(q1, q2) = Q(q1, q2) + 0.003;
end

figure(1)
imshow(Q, 'Colormap', winter);

Q1 = Q;

for i = 1:size(Q1, 1)

    for j = 1:size(Q1, 2)

        if (Q1(i, j) > 0.7) %bw???
            Q1(i, j) = 0.7;
        end

    end

end

figure(2)
imshow(Q1, 'Colormap', winter);

r = 1;
g = 0;
b = 1;

data_final = cat(3, Q * r, Q * g, Q * b);
figure(3)
imshow(data_final);
title('final result');