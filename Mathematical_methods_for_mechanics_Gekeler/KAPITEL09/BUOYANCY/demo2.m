function demo2
% E.W. Gekeler, Release 03/12/09 
% Example: convection in a square box
% stationary, without convection term
% X,Y : coordinates
% U,V : velocity in x- and y-direction
% TT  : temperature
% P   : pressure
% p,e,t: nodes,geometric boundary data, triangles
% p1,t1: data of intermediate nodes and their indices in triangles
% e is augmented by an eighth row with indices of midpoints in [p,p1]
% FF1   : File for first mesh (not used in MATLAB TOOLBOX)
% FF2   : File for geometry in MATLAB format 
% FF3   : File for boundary conditions and loads  
% OPTION_MESH = 1/2 Mesh without/with MATLAB TOOLBOX
% OPTION_P = 1: Specify one node value for pressure 

clear, clc, format short, format compact
% Example: 
FF1 = 'bsp02'; FF2 = 'bsp02g'; FF3 = 'bsp02h';
% Segment nrs. of outer boundary = [1,2,3,4]
% -- Parameters ---------------
nu      = 1;     % coeff. of viscosity
lambda  = 1;     % thermal conductivity [m*m/s]
g       = 9.81;   % grav. acceleration
beta = 142;
g_beta  = g*beta;
kappa   = 0.04;    % heat transfer coeff. [J/(m*s*K)
t_air = 15;         
epsilon = 0;         % Penalty Term, epsilon = 0.1 for stabilization
Parmeter = [nu,lambda,epsilon,g_beta,kappa,t_air];
OPTION_MESH = 1; REFINE = 3; % Number of uniform mesh refinements
%OPTION_MESH = 2; REFINE = 3; % Number of uniform mesh refinements
% -----------------------------
[p,e,t]   = start4stokes(FF1,FF2,OPTION_MESH,REFINE); 
[p1,e,t1] = mesh06_t(p,e,t); % e is enlarged by a further row 8

% bild00(p,e,t), pause,
% -- Load boundary values and loads ----
[RDU,RDV,RDT,RDP,FU,FV,FT] = feval(FF3,p,e,p1);  
N = size(p,2) + size(p1,2); % total node number
   RD = [RDU(1,:), RDV(1,:) + N, RDT(1,:)+2*N, RDP(1)+3*N;
         RDU(2,:), RDV(2,:)    , RDT(2,:), RDP(2)];
   [U,V,TT,P] = stokes1c(p,p1,t,t1,FU,FV,FT,RD,[],Parmeter);
save daten2a p e t p1 t1 
save daten2b U V TT P 

disp(' Call bild02 and select demo2 ! ')
  