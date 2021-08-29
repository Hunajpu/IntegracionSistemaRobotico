function q = pol_3(q0,qf,tf)
% sts es el step size o tamaño de paso
%pa in R^ (n x 3), n número de puntos vía
t0=0;
v0=0;
vf=0;

M=[1 t0 t0^2 t0^3;0 1 2*t0 3*t0^2;1 tf tf^2 tf^3;0 1 2*tf 3*tf^2];
b=[q0;v0;qf;vf];
a=M\b;

t=[.1:.1:tf].';
q=a(1)+a(2).*t+a(3).*(t.^2)+a(4).*(t.^3);

