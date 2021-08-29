function q = pol_5(q0,qf,tf)
% sts es el step size o tamaño de paso
%pa in R^ (n x 3), n número de puntos vía
t0=0;
v0=0;
vf=0;
a0=0;
af=0;

M=[1 t0 t0^2 t0^3 t0^4 t0^5;0 1 2*t0 3*t0^2 4*t0^3 5*t0^4; 0 0 2 6*t0 12*t0^2 20*t0^3;1 tf tf^2 tf^3 tf^4 tf^5;0 1 2*tf 3*tf^2 4*tf^3 5*tf^4; 0 0 2 6*tf 12*tf^2 20*tf^3];
b=[q0;v0;a0;qf;vf;af];
a=M\b;

t=[.1:.1:tf].';
q=a(1)+a(2).*t+a(3).*(t.^2)+a(4).*(t.^3)+a(5).*(t.^4)+a(6).*(t.^5);

