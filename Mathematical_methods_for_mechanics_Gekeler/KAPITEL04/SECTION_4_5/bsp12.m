function Y = bsp12(X,flag,Parmeter);
% Re-Entry Problem nach Stoer SI-Einheiten
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gegenueber bsp11.m wird nur die Endbedingung von
% Gamma weggelassen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% flag = 1: Objective function
% flag = 2: Inequalities, also []
% flag = 3: Equalities 
% flag = 4: Gradient of objective function
% flag = 5: Gradient of inequalities, also []
% flag = 6: Gradient of equalities
% -------------------------------------------
% Gradient von f: R_n -> R_m ist (m,n)-Matrix
% -------------------------------------------
n   = Parmeter(1); BTA  = Parmeter(2); G     = Parmeter(3);
R   = Parmeter(4); RRHO = Parmeter(5); T_END = Parmeter(6);
YAA = Parmeter(7:9); YEE  = Parmeter(10:12);
SDIV2M = Parmeter(13); GG = Parmeter(14);
FAKTOR = [0.5,ones(1,n-1), 0.5]/n; % Gewichte fuer Integration
D      = 0.5*ones(n+1,1);
E      = zeros(n+1,n+1) + tril(ones(n+1,n+1),-1) + diag(D);
E(:,1) = D; E(1,1) = 0;
E      = T_END*sparse(E)/n;

X1  = X(1:n+1); X2 = X(n+2:2*(n+1)); X3 = X(2*n+3:3*(n+1));
U   = X(3*n+4:4*(n+1)); % Kontrolle
RHO = RRHO*exp(-BTA*R*X3);
CW  = 1.174 - 0.9*cos(U);
CA  = 0.6*sin(U);
WDIVM   = SDIV2M*RHO.*X1.^2.*CW;
D1WDIVM = 2*SDIV2M*RHO.*X1.*CW;
D3WDIVM = -BTA*R*WDIVM;
D4WDIVM = 0.9*SDIV2M*RHO.*X1.^2.*sin(U);
ADIVM   = SDIV2M*RHO.*X1.^2.*CA;
D1ADIVM = 2*SDIV2M*RHO.*X1.*CA;
D3ADIVM = -BTA*R*ADIVM;
D4ADIVM = 0.6*SDIV2M*RHO.*X1.^2.*cos(U);

switch flag
case 1 % T_END nur Faktor, daher weglassen
   Y = FAKTOR*(GG*X1.^3.*sqrt(RHO));
case 3
   F1 = - WDIVM - G*sin(X2);
   F2 =   ADIVM./X1 + X1.*cos(X2)./(R*(1+X3)) - G*cos(X2)./X1;
   F3 =   X1.*sin(X2)/R;
   Y = [X1 - YAA(1) - E*F1;
        X2 - YAA(2) - E*F2;
        X3 - YAA(3) - E*F3;
        X1(n+1) - YEE(1);
        %X2(n+1) - YEE(2);
        X3(n+1) - YEE(3)];
case 4
   F1 =  GG*3*X1.^2.*sqrt(RHO);
   F3 =  - GG*BTA*R*X1.^3.*sqrt(RHO)/2;
   Y  = [FAKTOR.*F1',zeros(1,n+1),FAKTOR.*F3',zeros(1,n+1)];
case 6
   RX3 = R*(1 + X3);
   D1F1 = - D1WDIVM;
   D2F1 = - G*cos(X2);
   D3F1 = - D3WDIVM;
   D4F1 = - D4WDIVM;
   D1F2 =   D1ADIVM./X1 - ADIVM./X1.^2 + cos(X2)./RX3 + G*cos(X2)./X1.^2;
   D2F2 = - X1.*sin(X2)./RX3 + G*sin(X2)./X1;
   D3F2 =  D3ADIVM./X1 - R*X1.*cos(X2)./RX3.^2;
   D4F2  = D4ADIVM./X1;
   D1F3 =   sin(X2)/R;
   D2F3 =   X1.*cos(X2)/R;
   D3F3 =   zeros(n+1,1);
   D4F3 =   zeros(n+1,1);
   Y1 = [eye(n+1)-E*diag(D1F1),         - E*diag(D2F1), ...
                 -E*diag(D3F1),         - E*diag(D4F1);
                - E*diag(D1F2), eye(n+1)-E*diag(D2F2), ...
                 -E*diag(D3F2),       - E*diag(D4F2);
                - E*diag(D1F3),       - E*diag(D2F3), ...
         eye(n+1)-E*diag(D3F3),       - E*diag(D4F3)];

%   Y2 = zeros(3,4*(n+1));
%   Y2(1,n+1)     = 1;
%   Y2(2,2*(n+1)) = 1;
%   Y2(3,3*(n+1)) = 1;

   Y2 = zeros(2,4*(n+1));
   Y2(1,n+1)     = 1;
   %Y2(2,2*(n+1)) = 1;
   Y2(2,3*(n+1)) = 1;

   Y             = [Y1;Y2];
end
