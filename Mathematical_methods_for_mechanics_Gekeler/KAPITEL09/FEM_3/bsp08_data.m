function DATA = bsp08_data(p)
% Rechte Seite fuer Exakte Loesung in Beispiel08

LP = size(p,2); DATA = zeros(8,LP); FAC = 10;
for I = 1:size(p,2)
   x = p(1,I); y = p(2,I);
   x2 = x*x; x3 = x2*x; x4 = x3*x; x5 = x4*x; x6 = x5*x; x7 = x6*x;
   y2 = y*y; y3 = y2*y; y4 = y3*y; y5 = y4*y; y6 = y5*y; y7 = y6*y;

   z    = - 8*(x-x2)^2*(y - y2)^2;
   w    =   16*((6*x2-6*x+1)*(y-y2)^2 + (x-x2)^2*(6*y2-6*y+1));
   u    = - 16*(x - x2)^2*(y - y2)*(1 - 2*y);
   v    =   16*(y - y2)^2*(x - x2)*(1 - 2*x);

deltav_x = ...
384*y2-384*y3+192*y4-1152*x*y2-192*y+1152*x*y+32-192*x+1152*x2*y2 ...
 -1152*x2*y+192*x2;
deltau_y = ...
-32+192*y-384*x2+1152*x2*y+384*x3-192*x4-1152*x2*y2-1152*x*y+1152*x*y2 ...
 +192*x-192*y2;
grad2_x = ...
-3072*x2*y3+7168*x3*y3-7680*x4*y3+512*x*y3-2560*x*y4 ...
-35840*x3*y4+64512*x3*y5+15360*x2*y4-27648*x2*y5+3072*x5*y3 ...
-50176*x3*y6+21504*x2*y6+38400*x4*y4-15360*x5*y4+14336*x3*y7 ...
-6144*x2*y7-69120*x4*y5+27648*x5*y5+53760*x4*y6-15360*x4*y7 ...
-21504*x5*y6+6144*x5*y7+4608*x*y5-3584*x*y6+1024*x*y7;
grad1_y = ...
512*x3*y-3072*x3*y2-2560*x4*y+15360*x4*y2+7168*x3*y3-35840*x4*y3 ...
-7680*x3*y4+3072*x3*y5+64512*x5*y3-27648*x5*y2+4608*x5*y+38400*x4*y4 ...
-69120*x5*y4-15360*x4*y5+27648*x5*y5-50176*x6*y3+21504*x6*y2-3584*x6*y ...
+53760*x6*y4-21504*x6*y5+14336*x7*y3-6144*x7*y2+1024*x7*y-15360*x7*y4 ...
+6144*x7*y5;

DATA(:,I) = FAC*[z;w;u;v;deltav_x;deltau_y;grad2_x;grad1_y];
end
%   rr1 = - 16*(x-x*x)^2*(y - y*y)*(1-2*y)* ...
%   (16*(12*x - 6)*(y-y*y)^2 + 32*(x-x*x)*(6*y*y - 6*y + 1)*(1-2*x));
%   rr2 =   16*(y-y*y)^2*(x - x*x)*(1-2*x)* ...
%   (16*(12*y - 6)*(x-x*x)^2 + 32*(y-y*y)*(6*x*x - 6*x + 1)*(1-2*y));
%   rr = rr2 + rr1;

