% Piecewise linear minimization via ACCPM 
% EE364b example
% 
% PWL minimization problem: min max_i=1..m (a_i'x + b_i)
%
% Written by Joelle Skaf 

% number of variables n and linear functions m
n = 20; m = 100;

%********************************************************************
% generate an example
%********************************************************************
randn('state',1)
A = randn(m,n);
b = randn(m,1);

%********************************************************************
% compute pwl optimal point using CVX
%********************************************************************
cvx_begin
    variable x(n)  
    minimize max(A*x + b)
cvx_end
f_star = cvx_optval;

%********************************************************************
% cutting plane method 
%********************************************************************
% number of iterations 
niter = 200; 
% initial localization polyhedron {x | Cx <= d}
R = 1; 
C = [eye(n); -eye(n)];             
d = R*ones(2*n,1); 
% initial point 
x = zeros(n,1); 

f_save = []; f_best = []; 
% l_save = []; l_best = []; 
tot_nt = [];                        % total number of newton steps per iter
for iter = 1:niter 
    disp(iter)
    % find analytical center of polyhedron
    [x, H, nt] = acent(C,d,x);        
    tot_nt = [tot_nt nt]; 
    % find active functions at current x
    [f, idx] = max(A*x + b);        
    % subgradient at current x
    g = A(idx(1),:)';  
    % save current and best function values 
    f_save = [f_save f];
    f_best = [f_best min(f_save)];
    % update polyhedron 
    C = [C; g']; 
%     d = [d; g'*x];                        % neutral cut
    d = [d; g'*x + f_best(end) - f];        % deep cut
end

%********************************************************************
% plots 
%********************************************************************
figure
set(gca, 'FontSize',18);
semilogy(f_save - f_star)
xlabel('k'); 
ylabel('f-fmin');
print -depsc pwl_accpm
figure
set(gca, 'FontSize',18);
semilogy(f_best - f_star)
xlabel('k'); 
ylabel('fbest-fmin');
print -depsc pwl_accpm_best
figure 
set(gca, 'FontSize',18);
semilogy(cumsum(tot_nt), f_best - f_star)
xlabel('k'); 
ylabel('fall-fmin');
print -depsc pwl_accpm_all 
