%% path in r^3
% as something
% path=[-4.0000    1.0000    2.0000;
%    -3.7050    2.2211    2.7050;
%    -3.4100    2.4100    3.4100;
%    -3.1150    2.2211    4.1150;
%    -2.8200    1.0000    4.8200;
%    -2.8200    1.0000    4.8200;
%    -2.3500   -1.0000    5.0167;
%    -1.8800   -1.4398    5.2133;
%    -1.4100   -1.5563    5.4100;
%    -0.9400   -1.5900    5.6067;
%    -0.4700   -1.5563    5.8033;
%          0    1.0000    6.0000;
%          0    1.0000    6.0000;
%     0.7050    1.5110    5.7050;
%     1.4100    1.5900    5.4100;
%     2.1150    1.5110    5.1150;
%     2.8200    1.0000    4.8200;
%     2.8200    1.0000    4.8200;
%     3.0167   -1.0000    4.3500;
%     3.2133   -2.0510    3.8800;
%     3.4100   -2.3294    3.4100;
%     3.6067   -2.4100    2.9400;
%     3.8033   -2.3294    2.4700;
%     4.0000    1.0000    2.0000];
%% load('trayectoria.mat','txx')
matObj = matfile('trayectoria.mat');
path=matObj.txx;
plot3(path(:,1), path(:,2), path(:,3), 'color', 'k', 'LineWidth', 2)
xlabel('x');ylabel('y');zlabel('z') ;
grid on
%% Configuracion del robot
%theta d a alpha sigma offset
%l1a=7;l1b=2;l2=4;l3=4;l4=1.5;l5=1.5;l6=3;
a1=5;a2=5;d1=7;d2=2;d3=1;
L(1)=Link([0        d1	0	-pi/2   0]);
L(2)=Link([0        d2	a1  0       0]);
L(3)=Link([0        0	a2  0       0]);
L(4)=Link([-pi/2    0	0	-pi/2   0]);
L(5)=Link([pi/2     0	0	pi/2    0]);
L(6)=Link([0        d3	0   0       0]);
a2=2;a3=0.5;d2=4;d3=1;d4=2;
% L(1)=Link([0	5	-pi/2 	pi/2   0]);
% L(2)=Link([5	4	0       0   0]);
% L(3)=Link([0	0	pi/2    pi/2   0]);
% L(4)=Link([4	0	-pi/2	0	0]);
% L(5)=Link([0	0	pi/2	0	0]);
% L(6)=Link([0.5	0	0       0   0]);
qli=[-pi        pi;...          %theta 1
    -5*pi/4     pi/8;...        %theta 2
    -pi/4       pi/4;...      %theta 3
    -11*pi/18   17*pi/18;...    %theta 4
    -5*pi/9     5*pi/9;...      %theta 5
    -53*pi/36   53*pi/36];      %theta 6
qz=[0 0 0 0 0 0];%matriz con vectores articulares rengl?n
qfinal=[0 0  0 0 0 0];
antropom=SerialLink(L,'name','antrop','qlim',qli); %construcci?n del objeto polar,
%antropom.plotopt = {'workspace', [-9 9 -9 9 0 14]}; %opcion del m?todo plot,
antropom.plotopt = {'workspace', [-6 6 -6 6 0 8]}; %opcion del m?todo plot,
%Busquen los m?todos de SerialLink, en particular busquen
% fkine, plot, teach, ikine, mtraj, ctraj, fdyn
antropom.teach(qz)
% T=antropom.fkine(qfinal)
% XYZ=[path ones([size(path,1) 1])];
% q=interp(XYZ,2);
%rpp.plot(q);