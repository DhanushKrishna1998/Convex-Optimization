load piecewise_constant_data.mat y
A = [[1, 2, 0, 1], 
     [0, 0, 3, 1], 
     [0, 3, 1, 1], 
     [2, 1, 2, 5], 
     [1, 0, 3, 2]];
c_max = ones(5, 1)*100;
p = [3; 2; 7; 6];
p_disc = [2; 1; 4; 2];
q = [4; 10; 5; 10];
a = ones(4, 1);

cvx_begin
variable x(4)
variable revenue(4)
maximize (a'*revenue)
subject to 
    A*x - c_max <= 0
    revenue <= p.*x
    revenue <= p.*q + p_disc.*(x - q)
    
cvx_end
revenue
x
revenue/x