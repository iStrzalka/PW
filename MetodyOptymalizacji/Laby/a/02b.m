load("isoPerimData.mat");
h = a/N;

cvx_begin
    variable y(N + 1)
    expression suma
    suma = 0;
    for i = 1:N
        suma = suma + norm([h, y(i+1) - y(i)]);
    end
    minimize( h * sum(y))
    % maximize(h * sum(y))
    subject to 
        y(1) == 0
        y(N + 1) == 0
        y(F) == y_fixed(F)
        (y(3:N+1) - 2 .* y(2:N) + y(1:N-1)) ./ (h .* h) <= C
        -(y(3:N+1) - 2 .* y(2:N) + y(1:N-1)) ./ (h .* h) <= C
        suma <= L
        y >= 0
cvx_end

x = 0:a/N:a;
disp(h * sum(y));
plot(x, y);
hold on;
plot(x(F), y(F), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
hold off;
