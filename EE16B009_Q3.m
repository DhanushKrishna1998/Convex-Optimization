load Ratings.mat X
[m, n] = size(X);
cvx_begin sdp
variable A(m, n)
variable Y(m, m) symmetric
variable Z(n, n) symmetric
minimize trace(Z) + trace(Y)
subject to
    A(i) == X(i)
    [ Y A; ...
        A' Z ] >= 0
    Y >= 0
    Z >= 0
    A(j) > 0
    A(j) <= 5
cvx_end