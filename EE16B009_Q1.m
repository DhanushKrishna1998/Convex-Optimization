load piecewise_constant_data.mat y
w = 10;
sz = size(y);
n = sz(1);
c = zeros(n + 1, 1);
c(n + 1) = 1;
line1 = linspace(1, n-1, n-1);
line2 = linspace(2, n, n-1);
ii = ones(n-1, 1);
A1 = sparse(line1, line1, ii, n-1, n);
ii = -1;
A2 = sparse(line1, line2, ii, n-1, n);
A = A1 + A2;
cvx_begin
variable x(n+1)
minimize (c'*x)
subject to
    w*norm(y - x(1:n), 2) + norm(A*x(1:n), 1) - x(n+1) <= 0
cvx_end
plot(linspace(1, n, n), y, 'b', linspace(1, n, n), x(1:n), 'r');