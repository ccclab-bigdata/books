function Y = morley05(X,Y,U,COEFF)
% Morley's triangle, polynomial
% X,Y   : Coordinates of triangle
% U(1:2): argument of polynomial
% COEFF : Coefficients of polynomial
% Testen der Normalableitungen
COEFF = COEFF(:);
X1 = X(1); X2 = X(2); X3 = X(3); Y1 = Y(1); Y2 = Y(2); Y3 = Y(3);
X21 = X2 - X1; X31 = X3 - X1; X32 = X3 - X2; X23 = - X32;
Y21 = Y2 - Y1; Y31 = Y3 - Y1; Y32 = Y3 - Y2; Y23 = - Y32;
X4 = (X1+X2)/2; X5 = (X2+X3)/2; X6 = (X3+X1)/2; 
Y4 = (Y1+Y2)/2; Y5 = (Y2+Y3)/2; Y6 = (Y3+Y1)/2; 
X13 = - X31; Y13 = - Y31; Y12 = - Y21; X12 = - X21;
DET = X21*Y31 - X31*Y21;

L1 = sqrt(X21^2 + Y21^2); L2 = sqrt(X32^2 + Y32^2);
L3 = sqrt(X31^2 + Y31^2);
C4 =   Y21/L1; S4 =  - X21/L1;
C5 =   Y32/L2; S5 =  - X32/L2;
C6 =   Y13/L3; S6 =  - X13/L3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555
Z1 = (X2*Y3 - X3*Y2 + Y23*U(1) + X32*U(2))/DET;
Z2 = (X3*Y1 - X1*Y3 + Y31*U(1) + X13*U(2))/DET;
Z3 = 1 - Z1 - Z2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1 = (Y31*Y23 + X31*X23)/L3^2;   b1 = (Y12*Y23 + X12*X23)/L1^2;
a2 = (Y12*Y31 + X12*X31)/L1^2;   b2 = (Y23*Y31 + X23*X31)/L2^2;
a3 = (Y23*Y12 + X23*X12)/L2^2;   b3 = (Y31*Y12 + X31*X12)/L3^2;
% -- mit Anwendung des Cosinus-Satzes: --------------
a1 = (L1^2 - L2^2 - L3^2)/(2*L3^2); b1 = (L3^2 - L1^2 - L2^2)/(2*L1^2);
a2 = (L2^2 - L3^2 - L1^2)/(2*L1^2); b2 = (L1^2 - L2^2 - L3^2)/(2*L2^2);
a3 = (L3^2 - L1^2 - L2^2)/(2*L2^2); b3 = (L2^2 - L3^2 - L1^2)/(2*L3^2);
MU1 = (L3^2 - L2^2)/L1^2; MU2 = (L1^2 - L3^2)/L2^2;
MU3 = (L2^2 - L1^2)/L3^2;
a1 = - (1 + MU3)/2; b1 = - (1 - MU1)/2;
a2 = - (1 + MU1)/2; b2 = - (1 - MU2)/2;
a3 = - (1 + MU2)/2; b3 = - (1 - MU3)/2;

aa = [a1,a2,a3];
bb = [b1,b2,b3];

N1 = Z1 + Z1*(Z1-1) + a1*Z2*(Z2-1) + b1*Z3*(Z3-1);
N2 = Z2 + Z2*(Z2-1) + a2*Z3*(Z3-1) + b2*Z1*(Z1-1);
N3 = Z3 + Z3*(Z3-1) + a3*Z1*(Z1-1) + b3*Z2*(Z2-1);
N4 = DET*Z3*(Z3 - 1)/L1;
N5 = DET*Z1*(Z1 - 1)/L2;
N6 = DET*Z2*(Z2 - 1)/L3;
NN = [N1,N2,N3,N4,N5,N6];
Y = COEFF.'*NN.';

N1X = (2*Z1*Y23 + a1*(2*Z2-1)*Y31 + b1*(2*Z3-1)*Y12)/DET;
N2X = (2*Z2*Y31 + a2*(2*Z3-1)*Y12 + b2*(2*Z1-1)*Y23)/DET;
N3X = (2*Z3*Y12 + a3*(2*Z1-1)*Y23 + b3*(2*Z2-1)*Y31)/DET;
N4X = (2*Z3 - 1)*Y12/L1;
N5X = (2*Z1 - 1)*Y23/L2;
N6X = (2*Z2 - 1)*Y31/L3;

N1Y = (2*Z1*X32 + a1*(2*Z2-1)*X13 + b1*(2*Z3-1)*X21)/DET;
N2Y = (2*Z2*X13 + a2*(2*Z3-1)*X21 + b2*(2*Z1-1)*X32)/DET;
N3Y = (2*Z3*X21 + a3*(2*Z1-1)*X32 + b3*(2*Z2-1)*X13)/DET;
N4Y = (2*Z3 - 1)*X21/L1;
N5Y = (2*Z1 - 1)*X32/L2;
N6Y = (2*Z2 - 1)*X13/L3;

NX = [N1X,N2X,N3X,N4X,N5X,N6X];
NY = [N1Y,N2Y,N3Y,N4Y,N5Y,N6Y];
NN4 = C4*NX + S4*NY;
NN5 = C5*NX + S5*NY;
NN6 = C6*NX + S6*NY;

Y = COEFF.'*NN6.';



