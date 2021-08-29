clc;clear;close all;
%% path in r^3
matObj = matfile('trayectoria.mat');
path=matObj.txx;
path(:,1)=path(:,1)+2; % desplazmiento en x
%%
plot3(path(:,1), path(:,2), path(:,3), 'color', 'k', 'LineWidth', 2)
xlabel('x');ylabel('y');zlabel('z') ;
grid on
%% Configuracion del robot
%theta d a alpha sigma offset
a1=5.5;
a2=5.5;
d1=8;
d2=2;
d3=0.1;
L(1)=Link([0        d1	0	-pi/2   0]);
L(2)=Link([0        d2	a1  0       0]);
L(3)=Link([0        0	a2  0       0]);
L(4)=Link([-pi/2    0	0	-pi/2   0]);
L(5)=Link([0        0	0	pi/2    0]);
L(6)=Link([0        d3	0   0       0]);
%% Restricciones angulares
qli=[-pi        pi;...          %theta 1
    -5*pi/4     pi/8;...        %theta 2
    -pi/4       pi/4;...      %theta 3
    -11*pi/18   17*pi/18;...    %theta 4
    -5*pi/9     5*pi/9;...      %theta 5
    -53*pi/36   53*pi/36];      %theta 6
qz=[0 0 0 0 0 0];%matriz con vectores articulares rengl?n
qfinal=[0 0 0 0 0 0];
%% construcci?n del objeto polar,
antropom=SerialLink(L,'name','antrop','qlim',qli); 
%% Graficación de Trayectoria Planeada
%antropom.plotopt = {'workspace', [-6 6 -6 6 0 8]}; %opcion del m?todo plot,
antropom.plotopt = {'workspace', [-9 9 -9 9 0 14]}; %opcion del m?todo plot,
%% Modo teach del robot
%antropom.teach(qz)
%T=antropom.fkine(qfinal)
%% Animacion del seguimiento de Trayectoria
XYZ=[path ones([size(path,1) 1])];
q=interp(XYZ,2);
%antropom.plot(q);
%% Graficación de Trayectoria Real
hold on

trayectory=zeros(size(q,1),3);
for i=1:1:size(q,1)
    qs = num2cell(q(i,:));
    [q1 q2 q3 q4 q5 q6]=deal(qs{:});
    trayectory(i,1:3)=[d3*(sin(q1)*sin(q5) + sin(q2 + q3 + q4)*cos(q1)*cos(q5)) - d2*sin(q1) + a1*cos(q1)*cos(q2) + a2*cos(q1)*cos(q2)*cos(q3) - a2*cos(q1)*sin(q2)*sin(q3); d2*cos(q1) + a1*cos(q2)*sin(q1) - d3*cos(q1)*sin(q5) + a2*cos(q2)*cos(q3)*sin(q1) - a2*sin(q1)*sin(q2)*sin(q3) + d3*sin(q2 + q3 + q4)*cos(q5)*sin(q1); d1 - a2*sin(q2 + q3) - a1*sin(q2) + d3*cos(q2 + q3 + q4)*cos(q5)];
end
plot3(trayectory(:,1), trayectory(:,2), trayectory(:,3), 'color', 'b', 'LineWidth', 2)
%antropom.teach(qz)
antropom.plot(q);
