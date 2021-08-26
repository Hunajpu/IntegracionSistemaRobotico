function q = inversa_rpp(d_03)
% documentacion

dx=d_03(1);
dy=d_03(2);
dz=d_03(3);
if(dy==0)
    dy=10^-10;
end
l1=1; 
l2=1.5;
la=1;
lb=.5;


Th=atan2(la,lb);
l3=sqrt(la^2+lb^2);

q1=atan2(dy,dx);

X=(dx^2+dy^2+(dz-l1)^2-l2^2-l3^2)/(2*l2*l3);
q3=atan2(-sqrt(1-X^2),X)+Th;

A=(l2.^2+l3.^2+2.*l2.*l3.*cos(q3+(-1).*Th)).^(-1).*((dz+(-1).*l1).*l2+(dz+(-1).*l1).*l3.*cos(q3+(-1).*Th)+(-1).*dy.*l3.*csc(q1).*sin(q3+(-1).*Th));
B=(l2.^2+l3.^2+2.*l2.*l3.*cos(q3+(-1).*Th)).^(-1).*(dy.*(l2+l3.*cos(q3+(-1).*Th)).*csc(q1)+(dz+(-1).*l1).*l3.*sin(q3+(-1).*Th));

q2=atan2(A,B);

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




q=[q1,q2,q3];







