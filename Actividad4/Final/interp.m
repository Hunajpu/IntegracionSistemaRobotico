function q = interp(d_0_3,inter,matObj)
% sts es el step size o tamaño de paso
%pa in R^ (n x 3), n número de puntos vía

[n,c]=size(d_0_3);% se toma al número de puntos vía, n
q_0_6=zeros(n,6);

for i=1:1:n
    q_0_6(i,1:6)=inversa(d_0_3(i,1:3),matObj.Txx(1:3,1:3,i));
end

tiempo=0;
for i=1:1:n
    tiempo=tiempo+d_0_3(i,4);
end
ts=10; %interpolation of time step
q=zeros((tiempo*ts)+1,6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q_0_6 = [0 0 0 0 0 0 0;q_0_6 d_0_3(:,4)];


if (inter==1)
    T=1;
    for i=1:1:n
        t=q_0_6(i+1,7);
        q(T+1:T+(t*ts),:)=[
            pol_3(q_0_6(i,1),q_0_6(i+1,1),t) ...
            pol_3(q_0_6(i,2),q_0_6(i+1,2),t) ...
            pol_3(q_0_6(i,3),q_0_6(i+1,3),t) ...
            pol_3(q_0_6(i,4),q_0_6(i+1,4),t) ...
            pol_3(q_0_6(i,5),q_0_6(i+1,5),t) ...
            pol_3(q_0_6(i,6),q_0_6(i+1,6),t)];
        T=T+(t*ts);
    end
elseif(inter==2)
    T=1;
    for i=1:1:n
        t=q_0_6(i+1,7);
        q(T+1:T+(t*ts),:)=[
            pol_5(q_0_6(i,1),q_0_6(i+1,1),t) ...
            pol_5(q_0_6(i,2),q_0_6(i+1,2),t) ...
            pol_5(q_0_6(i,3),q_0_6(i+1,3),t) ...
            pol_5(q_0_6(i,4),q_0_6(i+1,4),t) ...
            pol_5(q_0_6(i,5),q_0_6(i+1,5),t) ...
            pol_5(q_0_6(i,6),q_0_6(i+1,6),t)];
        T=T+(t*ts);
    end  
elseif(inter==3)
     T=1;
    for i=1:1:n
        t=q_0_6(i+1,7);
        q(T+1:T+(t*ts),:)=[
            LSPB(q_0_6(i,1),q_0_6(i+1,1),t) ...
            LSPB(q_0_6(i,2),q_0_6(i+1,2),t)  ...
            LSPB(q_0_6(i,3),q_0_6(i+1,3),t)  ...
            LSPB(q_0_6(i,4),q_0_6(i+1,4),t)  ...
            LSPB(q_0_6(i,5),q_0_6(i+1,5),t)  ...
            LSPB(q_0_6(i,6),q_0_6(i+1,6),t)];
        T=T+(t*ts);
    end
end


