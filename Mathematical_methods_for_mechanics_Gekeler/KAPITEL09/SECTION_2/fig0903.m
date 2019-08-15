function fig0903
% Example 9.2, Geometry and boundary data

clf
X1 = [0, 2]; Y1 = [0,0];
plot(X1,Y1,'r','linewidth',3),hold on

T  = linspace(0,pi/2,30);
X2 = 5 - 3*cos(T); Y2 = 3*sin(T);
plot(X2,Y2,'r','linewidth',3), hold on

X3 = [5, 5]; Y3 = [3,5];
plot(X3,Y3,'r','linewidth',3), hold on

X4 = [5,0]; Y4 = [5,5];
plot(X4,Y4,'r','linewidth',3), hold on

X5 = [0, 0]; Y5 = [5,0];
plot(X5,Y5,'r','linewidth',3), hold on

%xlabel('X');
%ylabel('Y');
text(1.5,3.5,'\Omega','fontsize',36);
text(0.2,2.5,'u = 0','fontsize',22);
text(0.25,-0.5,'u_n = 0','fontsize',22);
text(3.2,4,'u_n = 0','fontsize',22);
text(0.8,5.5,'u_n + 4u = 1','fontsize',22);
text(2.9,1.5,'u_n + 3u = 2','fontsize',22);
%text(0.47,0.8,'C','fontsize',22);
%text(0.25,0.5,'D','fontsize',22);
%title('Randbedingungen','fontsize',24)
grid off
axis equal
axis([-1 6 -1 6])
