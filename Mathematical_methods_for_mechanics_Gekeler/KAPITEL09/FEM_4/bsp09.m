function [p,e,t] = bsp05g
% Daten fuer NAVIER in TRANSPORT
% nach H.Ninomiya/K.Onishi
XSCALE = 1/3; % ratio of X axis
YSCALE = 1/3; % ratio of Y axis

KNOTEN = [...
 36,  0,  18,  0,  36, 10,  42,  8,  42,  0 ...
  0,  0,  18, 10,  36, 20,  42, 16,  48, 12 ...
 48,  6,  48,  0,   0, 10,  18, 20,  36, 30 ...
 42, 24,  48, 18,  54, 12,  54,  8,  54,  4 ...
 54,  0,   0, 20,  18, 30,  48, 30,  36, 48 ...
 48, 48,  51, 25,  54, 20,  57, 15,   0, 30 ...
 18, 48,  60, 30,  60, 48,  36, 66,  48, 66 ...
 60, 66,  60, 26,  60, 22,  60, 18,   0, 48 ...
 18, 66,  69, 25,  72, 30,  72, 48,  36, 84 ...
 48, 84,  60, 84,  72, 66,  66, 20,  63, 15 ...
  0, 66,  18, 84,  78, 24,  72, 18,  84, 30 ...
 84, 48,  36,102,  48,102,  60,102,  72, 84 ...
 84, 66,  66, 12,   0, 84,   0,102,  18,102 ...
 78, 16,  84, 20,  72, 12, 102, 20, 102, 30 ...
102, 48,  72,102,  84, 84, 102, 66,  66,  8 ...
 78,  8,  84, 10, 102, 10,  72,  6, 120, 20 ...
120, 10, 120, 30, 120, 48,  84,102, 102, 84 ...
120, 66,  66,  4,  78,  0,  84,  0, 102,  0 ...
120,  0,  72,  0, 150, 20, 150, 10, 150,  0 ...
150, 30, 150, 48, 102,102, 120, 84, 150, 66 ...
 66,  0, 180, 20, 180, 10, 180,  0, 180, 30 ...
180, 48, 120,102, 150, 84, 180, 66, 210, 20 ...
210, 10, 210,  0, 210, 30, 210, 48, 150,102 ...
180, 84, 210, 66, 180,102, 210,102, 210, 84];

KNOTEN = (reshape(KNOTEN',2,120))';
KNOTEN(:,1) = KNOTEN(:,1)*XSCALE;
KNOTEN(:,2) = KNOTEN(:,2)*YSCALE;
p = KNOTEN';

ELEMENTE = [...
  30, 22, 23, 22, 13, 14, 13,  6,  7, 22, 14, 23, 13,  7, 14 ...
   6,  2,  7, 23, 14, 15, 14,  7,  8,  7,  2,  3, 14,  8, 15 ...
   7,  3,  8,  2,  1,  3, 15,  8, 16,  8,  3,  9,  3,  1,  4 ...
   8,  9, 16,  3,  4,  9,  1,  5,  4, 16,  9, 17,  9,  4, 10 ...
   4,  5, 11,  9, 10, 17,  4, 11, 10,  5, 12, 11, 17, 10, 18 ...
  10, 11, 19, 11, 12, 20, 10, 19, 18, 11, 20, 19, 12, 21, 20 ...
  15, 16, 24, 16, 17, 27, 17, 18, 28, 16, 27, 24, 17, 28, 27 ...
  18, 29, 28, 24, 27, 32, 27, 28, 37, 28, 29, 38, 27, 37, 32 ...
  28, 38, 37, 29, 39, 38, 32, 37, 42, 37, 38, 49, 38, 39, 50 ...
  32, 42, 43, 37, 49, 42, 38, 50, 49, 43, 42, 53, 42, 49, 54 ...
  49, 50, 62, 43, 53, 55, 42, 54, 53, 49, 62, 54, 62, 75, 68 ...
  75, 87, 79, 87,101, 92, 62, 68, 54, 75, 79, 68, 87, 92, 79 ...
  54, 68, 66, 68, 79, 76, 79, 92, 88, 54, 66, 53, 68, 76, 66 ...
  79, 88, 76, 53, 66, 67, 66, 76, 77, 76, 88, 89, 53, 67, 55 ...
  66, 77, 67, 76, 89, 77, 55, 67, 69, 67, 77, 78, 77, 89, 90 ...
  55, 69, 70, 67, 78, 69, 77, 90, 78, 70, 69, 80, 69, 78, 81 ...
  78, 90, 91, 70, 80, 82, 69, 81, 80, 78, 91, 81, 82, 80, 93 ...
  80, 81, 94, 81, 91, 95, 82, 93, 96, 80, 94, 93, 81, 95, 94 ...
  96, 93,102, 93, 94,103, 94, 95,104, 96,102,105, 93,103,102 ...
  94,104,103,105,102,110,102,103,111,103,104,112,105,110,113 ...
 102,111,110,103,112,111, 64, 63, 52, 63, 51, 52, 51, 40, 41 ...
  40, 30, 31, 64, 52, 65, 51, 41, 52, 40, 31, 41, 30, 23, 31 ...
  65, 52, 57, 52, 41, 45, 41, 31, 34, 31, 23, 25, 52, 45, 57 ...
  41, 34, 45, 31, 25, 34, 23, 15, 25, 57, 45, 58, 45, 34, 46 ...
  34, 25, 35, 25, 15, 26, 45, 46, 58, 34, 35, 46, 25, 26, 35 ...
  15, 24, 26, 58, 46, 59, 46, 35, 47, 35, 26, 36, 26, 24, 33 ...
  46, 47, 59, 35, 36, 47, 26, 33, 36, 24, 32, 33, 59, 47, 60 ...
  47, 36, 48, 36, 33, 44, 33, 32, 43, 59, 60, 72, 47, 48, 60 ...
  36, 44, 48, 33, 43, 44, 72, 60, 73, 60, 48, 61, 48, 44, 56 ...
  44, 43, 55, 72, 73, 84, 60, 61, 73, 48, 56, 61, 44, 55, 56 ...
  84, 73, 85, 73, 61, 74, 61, 56, 71, 56, 55, 70, 84, 85, 98 ...
  73, 74, 85, 61, 71, 74, 56, 70, 71, 98, 85, 99, 85, 74, 86 ...
  74, 71, 83, 71, 70, 82, 98, 99,107, 85, 86, 99, 74, 83, 86 ...
  71, 82, 83,107, 99,108, 99, 86,100, 86, 83, 97, 83, 82, 96 ...
 107,108,115, 99,100,108, 86, 97,100, 83, 96, 97,115,108,116 ...
 108,100,109,100, 97,106, 97, 96,105,115,116,118,108,109,116 ...
 100,106,109, 97,105,106,118,116,119,116,109,117,109,106,114 ...
 106,105,113,116,120,119,116,117,120,109,114,117,106,113,114];

ELEMENTE = (reshape(ELEMENTE',3,190));
t = ELEMENTE;

e1 = [6 2 1 5  12;
      2 1 5 12 21];
e1 = [e1;zeros(2,5); ones(1,5)];
e2 = [21 20 19 18 29 39 50 62 75 87;
      20 19 18 29 39 50 62 75 87 101];
e2 = [e2;zeros(2,10); 2*ones(1,10)];
e3 = [101 92 88 89 90 91  95 104;
       92 88 89 90 91 95 104 112];
e3 = [e3;zeros(2,8); 3*ones(1,8)];
e4 = [112 111 110 113 114 117 120;
      111 110 113 114 117 120 119];
e4 = [e4;zeros(2,7); 4*ones(1,7)];
e5 = [119 118 115 107 98 84 72 59 58 57 65;
      118 115 107  98 84 72 59 58 57 65 64];
e5 = [e5;zeros(2,11); 5*ones(1,11)];
e6 = [64 63 51 40 30 22 13;
      63 51 40 30 22 13  6];
e6 = [e6;zeros(2,7); 6*ones(1,7)];

e = [e1, e2, e3, e4, e5, e6];




