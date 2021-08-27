function q = interp(d_0_3,inter)
% sts es el step size o tamaño de paso
%pa in R^ (n x 3), n número de puntos vía


[n,c]=size(d_0_3);% se toma al número de puntos vía, n
q_0_3=zeros(n,3);
for i=1:1:n
q_0_3(i,1:3)=inversa(d_0_3(i,1:3));
end

tiempo=0;
for i=1:1:n
tiempo=tiempo+d_0_3(i,4);
end
q=zeros((tiempo*10)+1,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q_0_3 = [0 0 0 0;q_0_3 d_0_3(:,4)]


if (inter==1)
    T=1;
    for i=1:1:n
        t=q_0_3(i+1,4);
        q(T+1:T+(t*10),:)=[pol_3_rpp(q_0_3(i,1),q_0_3(i+1,1),t) pol_3_rpp(q_0_3(i,2),q_0_3(i+1,2),t)  pol_3_rpp(q_0_3(i,3),q_0_3(i+1,3),t)];
        
        T=T+(t*10);
    end
   
elseif(inter==2)
    
    T=1;
    for i=1:1:n
        t=q_0_3(i+1,4);    
        q(T+1:T+(t*10),:)=[pol_5_rpp(q_0_3(i,1),q_0_3(i+1,1),t) pol_5_rpp(q_0_3(i,2),q_0_3(i+1,2),t)  pol_5_rpp(q_0_3(i,3),q_0_3(i+1,3),t)];
        
        T=T+(t*10);
    end
    
elseif(inter==3)
     T=1;
    for i=1:1:n
        t=q_0_3(i+1,4);    
  
        q(T+1:T+(t*10),:)=[LSPB_rpp(q_0_3(i,1),q_0_3(i+1,1),t) LSPB_rpp(q_0_3(i,2),q_0_3(i+1,2),t)  LSPB_rpp(q_0_3(i,3),q_0_3(i+1,3),t)];
      
        T=T+(t*10);
    end
    
    
end


