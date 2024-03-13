P = 1/8 * [7,sqrt(3);sqrt(3),5];
xc = [1;1];
x0 = [2;-2];
alpha = 0.5;
beta = 0.5;
alpha = 0.3; % zad2
beta = 0.8; % zad2
epsilon = 1e-4;

% Newton_b
x = x0;
x = xc; % zad2
g = gradf0(x);
v = inv(hesjf0(x)) * -g;
delta = -g' * v;
i = 0;
while delta > epsilon
    % tłumienie
    s = 1;
    while f0(x + s * v) > f0(x) + s * alpha * g' * v
        s = beta * s;
    end
    % end tłumienie
    x = x + v;
    delta = -g' * v;
    g = gradf0(x);
    v = inv(hesjf0(x)) * -g;
    i = i + 1;
end
x_opt = x;

% zadanie 2
function y = f0(x) 
    t = 0.1;
    P = 1/8 * [7,sqrt(3);sqrt(3),5];
    xc = [1;1];
    if 1 - (x - xc)' * P * (x - xc) < 0
        y = -inf;
    else
        y = -log(1 - (x - xc)' * P * (x - xc));
    end
    y = y + t * (exp(x(1)+3*x(2)-0.1) + exp(-x(1)-0.1));
end

function y = gradf0(x)
    t = 0.1;
    P = 1/8 * [7,sqrt(3);sqrt(3),5];
    xc = [1;1];
    y = t * [exp(x(1)+3*x(2)-0.1) - exp(-x(1)-0.1); 3 * exp(x(1)+3*x(2)-0.1)];
    y = y + 2 * P * (x - xc) / (1 - (x - xc)' * P * (x - xc));
end

function y = hesjf0(x)
    t = 0.1;
    P = 1/8 * [7,sqrt(3);sqrt(3),5];
    xc = [1;1];
    y = t * [exp(x(1)+3*x(2)-0.1) + exp(-x(1)-0.1), 3 * exp(x(1)+3*x(2)-0.1); 3 * exp(x(1)+3*x(2)-0.1), 9 * exp(x(1)+3*x(2)-0.1)];
    y = y + 4 * P * (x - xc) * (x - xc)' * P / power((1 - (x - xc)' * P * (x - xc)), 2);
    y = y + 2 * P / (1 - (x - xc)' * P * (x - xc));
end

% z1
% function y = gradf0(x)
%     P = 1/8 * [7,sqrt(3);sqrt(3),5];
%     xc = [1;1];
%     y = [exp(x(1)+3*x(2)-0.1) - exp(-x(1)-0.1); 3 * exp(x(1)+3*x(2)-0.1)];
%     y = y + 2 * P * (x - xc);
% end
% 
% function y = hesjf0(x)
%     P = 1/8 * [7,sqrt(3);sqrt(3),5];
%     y = [exp(x(1)+3*x(2)-0.1) + exp(-x(1)-0.1), 3 * exp(x(1)+3*x(2)-0.1); 3 * exp(x(1)+3*x(2)-0.1), 9 * exp(x(1)+3*x(2)-0.1)];
%     y = y + 2 * P;
% end
% 
% function y = f0(x)
%     P = 1/8 * [7,sqrt(3);sqrt(3),5];
%     xc = [1;1];
%     y = exp(x(1)+3*x(2)-0.1);
%     y = y + exp(-x(1)-0.1);
%     y = y + (x - xc)' * P * (x - xc);
% end