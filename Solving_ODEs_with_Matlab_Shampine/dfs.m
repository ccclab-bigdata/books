function dfs(fun,window,npts)% Form a direction field and plot solutions for a scalar ODE.% FUN is an expression in the form of a string for evaluating the % differential equation y' = f(t,y). The independent variable must % be t and the dependent variable must be y. % WINDOW = [tl tr yb yt] says that the plot is to take place in a % window of tl <= t <= tr and yb <= y <= yt. If WINDOW is not % supplied, it is given the default value of [-10 10 -10 10].% NPTS = [nt ny] says that the direction field is to have nt equally% spaced points in t and ny equally spaced points in y. If NPTS is% a scalar, both nt and ny are given that value. If NPTS is not % supplied, it is given the default value of 20.% It is assumed that the differential equation is moderately stable.% The command%>> dfs('cos(t)*y',[0 12 -6 6])% forms a direction field for y' = cos(t)*y and readies the figure% for input of initial conditions for a solution. Fig. 1.4 of the% book could be reproduced in this way.% Clicking at a point within the window causes the solution through% the point to be computed and plotted up to the edge of the window.% To cope with singular points, the computation is terminated where a% small step size is needed to resolve a sharp change in the solution. global wB wT hmin f% Process input data.if nargin < 3    nt = 20;    ny = 20;elseif length(npts) == 1    nt = npts(1);    ny = npts(1);else    nt = npts(1);    ny = npts(2);endif nargin < 2    window = [-10 10 -10 10];endwL = window(1);wR = window(2);wB = window(3);wT = window(4);if wR <= wL    error('Must have window(1) < window(2).')elseif wT <= wB    error('Must have window(3) < window(4).')endhmin = 1e-4*(wR - wL);f = vectorize(inline(fun,'t','y'));% Set up grid of points for arrows of direction field:tpts = linspace(wL,wR,nt);ypts = linspace(wB,wT,ny);[T,Y] = meshgrid(tpts,ypts);% Evaluate the slopes and then normalize the vectors (1,S(i,j)). % Note that f has been vectorized so as to do this efficiently.S = f(T,Y);L = sqrt(1 + S.^2);NS = S ./ L;NL = 1 ./ L;% The arrows are long, so shorten them by half.quiver(T,Y,NL,NS,1/2,'b')axis tighttitle('Click at a point inside the window to get a solution.')xlabel('Click at a point outside the window to quit.')% Use an event function to terminate the integration on going% out the bottom or top of the window. Use an output function% to trap singular points by terminating on a minimum step size.options = odeset('Events',@events,'OutputFcn',@outfcn,...                 'RelTol',1e-4,'AbsTol',1e-7*max(abs(wB),abs(wT)));hold onwhile 1    % Get the initial condition from the plot.    [t0,y0] = ginput(1);    % Quit when the initial condition is outside the window.    if (t0 <= wL) | (wR <= t0) | (y0 <= wB) | (wT <= y0)        break;    end    [t,y] = ode45(@F,[t0,wR],y0,options);    plot(t,y,'r')    [t,y] = ode45(@F,[t0,wL],y0,options);    plot(t,y,'r')endhold off%===================================================function yp = F(t,y)global fyp = f(t,y);function [value,isterminal,direction] = events(t,y)global wB wTvalue = [wB; wT] - y;isterminal = [1; 1];direction = [0; 0];
function status = outfcn(t,y,flag)global hmin persistent previouststatus = 0;switch flagcase 'init'    previoust = t(1);case ''    h = t(end) - previoust;    previoust = t(end);    status = (abs(h) <= hmin);case 'done'    clear previoustend