function q = inversa_rpp(d_03)
% documentacion

dx=d_03(1);
dy=d_03(2);
dz=d_03(3);
if(dy==0)
    dy=10^-10;
end
% a1=2;
% a2=2;
% d1=0;
% d2=0.5;
% d3=0.5;
a1=5;a2=5;d1=7;d2=2;d3=1;
%%%%%%%%%%%%%
ox=0; oy=0; oz=0;
xc=0; yc=0; zc=0;

d6=d3;
xc=ox-d6*r13;
yc=oy-d6*r23;
zc=oz-d6*r33;
d_2=a1+a2;
% q1 = atan2(xc,yc)-atan2(-sqrt(xc^2+yc^2-d_2^2),d_2);
% q2 = 
% %%%%%%%%%%
% d_2
% zc
% d1
% a2
% a3
% s3
% c1
% c23
% q1 = atan2(dx,dy);
% q2 = atan2(-sqrt(dx^2+dy^2-d_2^2),zc-d1) - atan2(a2+a3,a3*s3);
% D = (dx^2+dy^2-d+(zc-d1)^2-a2^2-a3^3)/(2*a2*a3);
% q3 = atan2(D,+sqrt(1-D^2));
% q4 = atan2(c1*c23*r13+s1*c23*r23+s23*r33,-c1*s23*r13-s1*s23*r23+c23*r33);
% q5 = atan2(-s1*r11+c1*r21,s1*r12-c1*r22);
% q6 = atan2(-s1*r11+c1*r21,s1*r12-c1*r22);
%%%%%%%%%%%%
% Th=atan2(la,lb);
% l3=sqrt(la^2+lb^2);
% 
% q1=atan2(dy,dx);
% 
% X=(dx^2+dy^2+(dz-l1)^2-l2^2-l3^2)/(2*l2*l3);
% q3=atan2(-sqrt(1-X^2),X)+Th;
% 
% A=(l2.^2+l3.^2+2.*l2.*l3.*cos(q3+(-1).*Th)).^(-1).*((dz+(-1).*l1).*l2+(dz+(-1).*l1).*l3.*cos(q3+(-1).*Th)+(-1).*dy.*l3.*csc(q1).*sin(q3+(-1).*Th));
% B=(l2.^2+l3.^2+2.*l2.*l3.*cos(q3+(-1).*Th)).^(-1).*(dy.*(l2+l3.*cos(q3+(-1).*Th)).*csc(q1)+(dz+(-1).*l1).*l3.*sin(q3+(-1).*Th));
% 
% q2=atan2(A,B);

% lol=l2.*cos(q1).*cos(q2)+l3.*(cos(q1).*cos(q2).*cos(q3+(-1).*Th)+(-1).*cos(q1).*sin(q2).*sin(q3+(-1).*Th))
%     
% if(dx==l2.*cos(q1).*cos(q2)+l3.*(cos(q1).*cos(q2).*cos(q3+(-1).*Th)+(-1).*cos(q1).*sin(q2).*sin(q3+(-1).*Th)))
%     dx
%     l2.*cos(q1).*cos(q2)+l3.*(cos(q1).*cos(q2).*cos(q3+(-1).*Th)+(-1).*cos(q1).*sin(q2).*sin(q3+(-1).*Th))
% end
% if(dy==l2.*cos(q2).*sin(q1)+l3.*(cos(q2).*cos(q3+(-1).*Th).*sin(q1)+(-1).*sin(q1).*sin(q2).*sin(q3+(-1).*Th)))
%     2
% end
% if(dz==l1+l2.*sin(q2)+l3.*(cos(q3+(-1).*Th).*sin(q2)+cos(q2).*sin(q3+(-1).*Th)))
%     3
% end




q=[q1,q2,q3,q4,q5,q6];







