alpha = 0.4;
beta = 0.9;

x = 0:0.001:2.5;
plot(x, phi(x));

hold on;
for al = 0:0.1:0.5
    plot(x, phi(0) + al * -44 * x);
end
plot(x, phi(0) + -44 * x);

s = 1;
while phi(s) > phi(0) + alpha * -44 * s
    plot(s, phi(s), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
    plot(s, phi(0) + alpha * -44 * s, 'bo', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
    s = beta * s;
end
plot(s, phi(s), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
plot(s, phi(0) + alpha * -44 * s, 'bo', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
hold off;

xlim([0 2.5]);
ylim([-30 50]);

function y = phi(x)
    y = 20 .* x .* x - 44 .* x + 29;
    % y = y + 40 .* x .* x .* x;
end
