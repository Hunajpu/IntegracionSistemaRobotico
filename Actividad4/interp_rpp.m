function q = interp_rpp(d_0_3,inter)
% sts es el step size o tamaño de paso
%pa in R^ (n x 3), n número de puntos vía
l1=1; 
l2=1.5;
la=1;
lb=.5;

[n,c]=size(d_0_3);% se toma al número de puntos vía, n
tiempo=0;
for i=1:1:n
tiempo=tiempo+d_0_3(i,4);
end
q=zeros((tiempo*10)+1,3);
size(q)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d_0_3=[(l2+la) 0 [l1-lb] 0;d_0_3];


if (inter==1)
    T=1;
    for i=1:1:n
        t=d_0_3(i+1,4);    
        M=[pol_3_rpp(d_0_3(i,1),d_0_3(i+1,1),t) pol_3_rpp(d_0_3(i,2),d_0_3(i+1,2),t)  pol_3_rpp(d_0_3(i,3),d_0_3(i+1,3),t)];
        size(M)
        for j=T+1:1:T+(t*10)
            
            q(j,:)=inversa_rpp(M(j-T,:));
        end
        T=T+(t*10);
    end
   
elseif(inter==2)
    
    T=1;
    for i=1:1:n
        t=d_0_3(i+1,4);    
        M=[pol_5_rpp(d_0_3(i,1),d_0_3(i+1,1),t) pol_5_rpp(d_0_3(i,2),d_0_3(i+1,2),t)  pol_5_rpp(d_0_3(i,3),d_0_3(i+1,3),t)];
        for j=T+1:1:T+(t*10)
            q(j,:)=inversa_rpp(M(j-T,:));
        end
        T=T+(t*10);
    end
    
elseif(inter==3)
      T=1;
    for i=1:1:n
        t=d_0_3(i+1,4);    
        M=[LSPB_rpp(d_0_3(i,1),d_0_3(i+1,1),t) LSPB_rpp(d_0_3(i,2),d_0_3(i+1,2),t)  LSPB_rpp(d_0_3(i,3),d_0_3(i+1,3),t)];
        for j=T+1:1:T+(t*10)
            q(j,:)=inversa_rpp(M(j-T,:));
        end
        T=T+(t*10);
    end
    
    
end


