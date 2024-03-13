load("isoPerimData.mat");
h = a/N;
y = optimvar('y', N + 1);

% zad1, d) : max
% b, c) : min
p = optimproblem("Objective", h * sum(y), "ObjectiveSense", "max");
% p = optimproblem("Objective", h * sum(y), "ObjectiveSense", "min");
p.Constraints.c1 = y(1) == 0;
p.Constraints.c2 = y(N + 1) == 0;
p.Constraints.c3 = y(F) == y_fixed(F);

% comment for c)
const4 = optimineq(N - 1);
const5 = optimineq(N - 1);
for i = 1:N-1
    const4(i) = (y(i+2) - 2 .* y(i+1) + y(i)) ./ (h .* h) <= C;
    const5(i) = -(y(i+2) - 2 .* y(i+1) + y(i)) ./ (h .* h) <= C;
end

p.Constraints.c4 = const4;
p.Constraints.c5 = const5;

suma = 0;

for i = 1:N
    suma = suma + norm([h, y(i+1) - y(i)]);
end
p.Constraints.c6 = suma <= L;

% % uncomment for b)
% const7 = optimineq(N + 1);
% for i = 1:N+1
%     const7(i) = y(i) >= 0;
% end 
% p.Constraints.c7 = const7;

initial.y = ones(N + 1, 1) * 1;

sol = solve(p, initial);

disp(h * sum(sol.y));
plot(0:a/N:a, sol.y);
hold on;
plot(x(F), sol.y(F), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
hold off;