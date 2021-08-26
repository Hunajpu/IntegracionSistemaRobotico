function q = LSPB_rpp( q0,qf,tf )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

V=1.2*(qf-q0)/tf
if(V>=0)
tb=(q0+(V*tf)-qf)/tf;
else
tb=-(q0+(V*tf)-qf)/tf;
end
tb_t=round(tb,1);
t1=[.1:.1:tb_t].';
t2=[(tb_t+.1):.1:(tf-tb_t)].';
t3=[(tf+.1-tb_t):.1:tf].';

q=[q0+(V*t1.^2)/(2*tb) ; ((qf+q0-V*tf)/2)+(V.*t2) ; (qf)-(V/tb)*((tf^2/2)-(tf.*t3)+(t3.^2/2))];


end

