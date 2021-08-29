function q = inversa(d_03,r)
% documentacion

dx=d_03(1);
dy=d_03(2);
dz=d_03(3);
if(dy==0)
    dy=10^-10;
end
%% Dimensiones del robot
a1=5.5;
a2=5.5;
d1=8;
d2=2;
d3=0.1;
%% Asignación centro del efector final
ox=dx;
oy=dy;
oz=dz;
%% Orientación del efector 
% alpha=pi;
% %theta=sin(ox/sqrt(ox^2+oy^2));
% theta=asind(ox/sqrt(ox^2+oy^2+oz^2));
% r=rotz(theta)*rotx(alpha);
% r13=cos(alpha)*(ox/sqrt(ox^2+oy^2));
% r23=cos(alpha)*(oy/sqrt(ox^2+oy^2));
% r33=sin(alpha);
%% Centro de la parte de posición
xc = ox-d3*r(1,3);
yc = oy-d3*r(2,3);
zc = oz-d3*r(3,3);
% xc = ox-d3*r13;
% yc = oy-d3*r23;
% zc = oz-d3*r33;
%% Cinemática inversa
q1 = atan2(yc,xc)-atan2(d2,sqrt(xc^2+yc^2-d2^2));
c3=((d1-zc)^2+xc^2+yc^2-d2^2-a1^2-a2^2)/(2*a1*a2);
q3 = atan2(-sqrt(1-c3^2),c3);
q2 = atan2(d1-zc,sqrt(xc^2+yc^2-d2^2))-atan2(a2*sin(q3),a1+a2*cos(q3));
q5 = atan2(r(1,3)*sin(q1)-r(2,3)*cos(q1),sqrt(1-(r(1,3)*sin(q1)-r(2,3)*cos(q1))^2));
s23=sin(q2+q3);
c23=cos(q2+q3);
c1=cos(q1); 
s1=sin(q1);
q4 = atan2(r(3,3)*s23 + r(1,3)*c23*c1 + r(2,3)*c23*s1, r(3,3)*c23 - r(1,3)*s23*c1 - r(2,3)*s23*s1);
q6 = atan2(r(1,1)*s1-r(2,1)*c1,r(2,2)*c1-r(1,2)*s1);

%q4=atan2(c1*c23*r(1,3)+s1*c23*r(2,3)+s23*r(3,3),-c1*c23*r(1,3)-s1*s23*r(2,3)+c23*r(3,3));
%q5=atan2(-s1*r(1,1)+c1*r(2,1),s1*r(1,2)-c1*r(2,2));
%q6=atan2(-s1*r(1,1)+c1*r(2,1),s1*r(1,2)-c1*r(2,2));

q=[q1,q2,q3,q4,q5,q6];







