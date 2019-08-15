function v = stab_region(p,q,m)
% Program for plotting of stability regions of 
% single step methods

n = length(p);
y = p - q;
r = roots(y);
Re = real(r);
Im = imag(r);
v = [Re(1) Im(1)];
for k = 1:m
   l = 2*pi*k/m;
   u = exp(l*i);
   y = p - u*q;
   r = roots(y);
   Re = real(r);
   Im = imag(r);
   K = find(Im >= 0);
   w = [Re(K), Im(K)];
   v = [v; w];
end
