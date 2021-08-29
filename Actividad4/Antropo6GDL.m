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
a1=5;a2=5;d1=7;d2=0.4;d3=1;
L(1)=Link([0        d1	0	-pi/2   0]);
L(2)=Link([0        d2	a1  0       0]);
L(3)=Link([0        0	a2  0       0]);
% L(4)=Link([-pi/2    0	0	-pi/2   0]);
% L(5)=Link([pi/2     0	0	pi/2    0]);
% L(6)=Link([0        d3 0   0   0]);
% a2=2;a3=0.5;d2=4;d3=1;d4=2;
% L(1)=Link([0	5	-pi/2 	pi/2   0]);
% L(2)=Link([5	4	0       0   0]);
% L(3)=Link([0	0	pi/2    pi/2   0]);
% L(4)=Link([4	0	-pi/2	0	0]);
% L(5)=Link([0	0	pi/2	0	0]);
% L(6)=Link([0.5	0	0       0   0]);
qli=[-pi        pi;...          %theta 1
    -5*pi/4     pi/8;...        %theta 2
    -pi/4       pi/4];%...      %theta 3
%     -11*pi/18   17*pi/18;...    %theta 4
%     -5*pi/9     5*pi/9;...      %theta 5
%     -53*pi/36   53*pi/36];      %theta 6
qz=[0 0 0];%matriz con vectores articulares rengl?n
qfinal=[0 0 0];
antropom=SerialLink(L,'name','antrop','qlim',qli); %construcci?n del objeto polar,
%antropom.plotopt = {'workspace', [-9 9 -9 9 0 14]}; %opcion del m?todo plot,
antropom.plotopt = {'workspace', [-9 9 -9 9 0 14]}; %opcion del m?todo plot,
%Busquen los m?todos de SerialLink, en particular busquen
% fkine, plot, teach, ikine, mtraj, ctraj, fdyn
%antropom.teach(qz)
%T=antropom.fkine(qfinal)
XYZ=[path ones([size(path,1) 1])];
q=interp(XYZ,2);

%% Graficación de Trayectoria Real
hold on
trayectory=zeros(size(q,1),3);
for i=1:1:size(q,1)
    q1=q(i,1);
    q2=q(i,2);
    q3=q(i,3);
    q4=0;%q(i,4);
    q5=0;%q(i,5);
    q6=0;%q(i,6);
    trayectory(i,1:3)=[d3*(sin(q1)*sin(q5) + sin(q2 + q3 + q4)*cos(q1)*cos(q5)) - d2*sin(q1) + a1*cos(q1)*cos(q2) + a2*cos(q1)*cos(q2)*cos(q3) - a2*cos(q1)*sin(q2)*sin(q3); d2*cos(q1) + a1*cos(q2)*sin(q1) - d3*cos(q1)*sin(q5) + a2*cos(q2)*cos(q3)*sin(q1) - a2*sin(q1)*sin(q2)*sin(q3) + d3*sin(q2 + q3 + q4)*cos(q5)*sin(q1); d1 - a2*sin(q2 + q3) - a1*sin(q2) + d3*cos(q2 + q3 + q4)*cos(q5)];
end
plot3(trayectory(:,1), trayectory(:,2), trayectory(:,3), 'color', 'b', 'LineWidth', 2)

antropom.plot(q);
