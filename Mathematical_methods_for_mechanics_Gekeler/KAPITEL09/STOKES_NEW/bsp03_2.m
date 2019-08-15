function [p,e,t] = bsp03_2
% Flow past half cylinder, mod. geometry, coarse mesh

AA = 10/3;
p = [0, 10/3, 15/3, 20/3, 9,  12,  12,  9,  15/3,  0;
     0,    0,  5/3,    0, 0,   0,  AA,  AA,   AA,  AA]; 

t = [ 1,  2,  3,  3,  3,  4,  5,  5;
      2,  3,  9,  8,  4,  5,  6,  7;
     10, 10, 10,  9,  8,  8,  7,  8]; 
t = [t;ones(1,6),2*ones(1,2)];     

e = [1,   2,   3,  4,  5,  8,  9    10,    5,  6,  7;     
     2,   3,   4,  5,  8,  9,  10    1,    6,  7,  8;   
     0,   0, 1/2,  0,  0,  0,  1/2   0,    0,  0,  0;
     1, 1/2,   1,  1,  1,  1/2, 1,   1,    1,  1,  1;
     1,   2,   2,  3,  4,  5,   5,   6,    7,  8,  9;
     1,   1,   1,  1,  1,  1,   1,    1,   2,  2,  2;     
     0,   0,   0,  0,  2,  0,   0     0,   0,  0,  0];
