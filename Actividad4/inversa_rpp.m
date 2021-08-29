function q = inversa_rpp(d_03)
% documentacion

dx=d_03(1);
dy=d_03(2);
dz=d_03(3);
if(dy==0)
    dy=10^-10;
end

a1=5;a2=5;d1=7;d2=0.4;d3=1;

q1 = atan2(dy, dx) - atan2(d2, sqrt(dx^2 + dy^2 - d2^2));

D = (dx^2 + dy^2 + (d1-dz)^2 - a1^2 - a2^2)/(2*a1*a2);

q3 = atan2(-sqrt(1-D^2), D);

q2 = atan2(d1-dz, sqrt(dx^2 + dy^2)) - atan2(a2*sin(q3), a1 + a2*cos(q3));

q=[q1,q2,q3];







