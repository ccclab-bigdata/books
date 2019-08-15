function [p,e,t] = bsp01
% Tidal flow data in sample bay
% ver.1.0AT       by H.Ninomiya
%
XBAI = 1000;        % XBAI  : scale factor in X axis
YBAI = 1000;        % YBAI  : scale factor in Y axis
HBAI = 0.1 ;        % HBAI  : scale factor in depth
%
%  KNOTEN: X,Y,H : X,Y and depth coordinates
KNOTEN = [...
 0  ,10  ,100; 0  , 9  ,100; 0  , 8  ,100;
 0  , 7  ,100; 0  , 6  ,100; 0.8,11.2,100;
 1  ,10  ,100; 1  , 9  ,100; 1  , 8  , 70;
 1  , 7  , 75; 1  , 6  , 80; 0.7, 5  ,100;
 1.1, 4  , 80; 1.3, 3  , 40; 1.5, 2  , 20;
 2  , 0.7,  1; 2  ,11.8, 90; 2  ,11  , 90;
 2  ,10  , 80; 2  , 9  , 40; 2  , 8  , 30;
 2  , 7  , 38; 2  , 6  , 90; 2  , 5  ,100;
 2  , 4  , 70; 2  , 3  , 30; 2.2, 1.8, 10;
 2.7, 0.4,  0; 3  ,11.7, 80; 3  ,11  , 60;
 3  ,10  , 30; 3  , 9  ,  7; 2.8, 8  ,  5;
 3  , 7  ,  7; 3  , 6  , 60; 3  , 5  ,100;
 3  , 4  , 60; 3  , 3  , 20; 3  , 2  ,  8;
 3.2, 1  ,  1; 4  ,12.2, 80; 4  ,11  , 60;
 4  ,10  ,  7; 4  , 9  ,  4; 3.5, 8.5,  2;
 3.2, 7.8,  2; 3.5, 7.3,  5; 4  , 7.1,  7;
 4.6, 6.9, 10; 5.3, 6.1, 50; 5.3, 7  ,100;
 5.6, 8  , 10; 6.4, 8.6,  7; 6  , 9.4,  3;
 5.2, 9.6,  2; 4.9, 8.7,  1; 4.2, 8.3,  1;
 4  , 6  , 40; 4  , 5  ,100; 4  , 4  , 50;
 4  , 3  , 10; 4  , 2.1,  5; 5  ,13  ,100;
 5  ,12  , 70; 5  ,11  , 30; 5  ,10  ,  5;
 4.5, 9  ,  2; 5  , 5  ,100; 5  , 4  , 40;
 4.8, 3.3,  8; 6  ,14  , 80; 6  ,13  ,100;
 6  ,12  , 80; 6  ,11  , 20; 5.8,10.3,  7;
 6  , 7  , 80; 6  , 6  ,100; 6  , 5  ,100;
 6  , 4.1, 30; 7  ,15  , 50; 7  ,14  , 70;
 7  ,13  ,100; 7  ,12  , 70; 7  ,11  , 40;
 7  ,10  , 30; 7  , 9  , 40; 7  , 8  , 90;
 7  , 7  ,100; 7  , 6  ,100; 7  , 4.7, 60;
 8  ,15.6, 40; 8  ,14  , 75; 8  ,13  ,100;
 8  ,12  , 80; 8  ,11  , 70; 8  ,10  , 80;
 8  , 9  , 90; 8  , 8  ,100; 8  , 7  ,100;
 7.8, 5.3, 80; 9.2,15  , 50; 9.4,14  , 80;
 9.4,13  ,100; 9  ,12  ,100; 8.7,11  ,100;
 8.8,10  ,100; 8.9, 9  ,100; 9  , 8  ,100;
 8.9, 7  ,100; 8.5, 6  ,100; 8  ,15  , 60];
%                *******
KNOTEN(:,1) = KNOTEN(:,1)*XBAI;
KNOTEN(:,2) = KNOTEN(:,2)*YBAI;
KNOTEN(:,3) = KNOTEN(:,3)*HBAI;

p = KNOTEN.';
% sample data elements
ELEMENTE = [...
   1,  2,  8;   2,  3,  9;   3,  4,  9;   4,  5, 10;
   1,  7,  6;   1,  8,  7;   2,  9,  8;   4, 10,  9;
   5, 11, 10;   5, 12, 11;   6, 18, 17;   6,  7, 18;
   7, 19, 18;   7, 20, 19;   7,  8, 20;   8, 21, 20;
   9, 21,  8;  10, 21,  9;  10, 22, 21;  10, 11, 22;
  11, 23, 22;  11, 24, 23;  12, 24, 11;  12, 13, 24;
  13, 25, 24;  14, 25, 13;  14, 26, 25;  14, 15, 26;
  15, 27, 26;  15, 16, 27;  17, 30, 29;  17, 18, 30;
  18, 31, 30;  18, 19, 31;  19, 32, 31;  19, 20, 32;
  20, 33, 32;  20, 21, 33;  21, 22, 33;  22, 34, 33;
  22, 23, 34;  23, 35, 34;  23, 36, 35;  23, 24, 36;
  24, 37, 36;  25, 37, 24;  25, 38, 37;  26, 38, 25;
  26, 39, 38;  27, 39, 26;  27, 40, 39;  16, 40, 27;
  16, 28, 40;  29, 42, 41;  30, 42, 29;  30, 43, 42;
  31, 43, 30;  31, 44, 43;  32, 44, 31;  45, 44, 32;
  33, 45, 32;  33, 46, 45;  34, 46, 33;  34, 47, 46;
  34, 48, 47;  34, 58, 48;  35, 58, 34;  35, 59, 58;
  35, 36, 59;  36, 60, 59;  36, 37, 60;  37, 61, 60;
  37, 38, 61;  38, 62, 61;  38, 39, 62;  39, 40, 62;
  41, 64, 63;  41, 65, 64;  42, 65, 41;  42, 66, 65;
  43, 66, 42;  43, 67, 66;  43, 44, 67;  66, 67, 55;
  44, 57, 67;  67, 56, 55;  45, 57, 44;  67, 57, 56;
  48, 58, 49;  49, 58, 50;  58, 68, 50;  58, 59, 68;
  59, 69, 68;  59, 60, 69;  60, 70, 69;  60, 61, 70;
  61, 62, 70;  63, 72, 71;  63, 73, 72;  63, 64, 73;
  64, 74, 73;  64, 65, 74;  65, 75, 74;  65, 66, 75;
  66, 55, 75;  55, 54, 75;  52, 87, 53;  52, 76, 87;
  51, 76, 52;  50, 76, 51;  76, 88, 87;  76, 89, 88;
  50, 77, 76;  77, 89, 76;  50, 78, 77;  50, 68, 78;
  77, 78, 89;  68, 79, 78;  68, 69, 79;  70, 79, 69;
  79, 90, 78;  78, 90, 89;  71, 81, 80;  71, 82, 81;
  71, 72, 82;  72, 83, 82;  72, 73, 83;  73, 84, 83;
  73, 74, 84;  74, 85, 84;  75, 85, 74;  75, 54, 85;
  54, 86, 85;  54, 53, 86;  53, 87, 86;  80,111, 91;
  80, 92,111;  81, 92, 80;  81, 93, 92;  82, 93, 81;
  82, 94, 93;  83, 94, 82;  83, 95, 94;  84, 95, 83;
  84, 96, 95;  85, 96, 84;  85, 97, 96;  86, 97, 85;
  86, 98, 97;  87, 98, 86;  87, 88, 98;  88, 99, 98;
  88, 89, 99;  89,110, 99;  89,100,110;  90,100, 89;
 111,101, 91; 111,102,101;  92,102,111;  92,103,102;
  93,103, 92;  93,104,103;  94,104, 93;  94,105,104;
  95,105, 94;  95,106,105;  96,106, 95;  96,107,106;
  97,107, 96;  97,108,107;  98,108, 97;  98, 99,108;
  99,109,108;  99,110,109];
t = ELEMENTE.';
%
% Rand fuer Oeffnung der Bucht
e1 = [1 2 3 4;
      2 3 4 5];
e1 = [e1;zeros(2,4); ones(1,4)];
% Rand der Bucht
e2 = [...
   5, 12, 13, 14, 15, 16, 28, 40, 62, 70 ...
  79, 90,100,110,109,108,107,106,105,104 ...
 103,102,101, 91, 80, 71, 63, 41, 29, 17 ...
   6;

   12, 13, 14, 15, 16, 28, 40, 62, 70, 79  ...
  90 ,100,110,109,108,107,106,105,104, 103 ...
  102,101, 91, 80, 71, 63, 41, 29, 17, 6   ...
  1];
e2 = [e2;zeros(2,31); 2*ones(1,31)];

% Rand der Insel
e3 = [45, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46;
      57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45];
e3 = [e3;zeros(2,13); 3*ones(1,13)];

e = [e1, e2, e3];

