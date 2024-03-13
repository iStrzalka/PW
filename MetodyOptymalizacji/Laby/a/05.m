t = 0:1/500:1;
y = (1 + 0.5 .* sin(11 .* t)) .* 30 .* sin(5 .* t);

teta = 0.5;
ro = 0.05;

cvx_begin
    variables x(n)
    expression f
    f = sum
    minimize sum(power(fu - y, 2) + mi * norm(x, 1))
cvx_end

% 
% teta1 = 0:0.001:1;
% w1 = 0:5:150;
% 
% teta2 = 0:0.002:1;
% w2 = 5:5:150;
%

function y = f(x, ro, teta, wi, phi)
    y = e^(-power(x - teta, 2)/power(ro, 2)) * cos(wi * x + phi);
end
