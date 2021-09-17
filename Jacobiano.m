global  Nbus Jacob

Hjacob = zeros(Nbus);
Mjacob = zeros(Nbus);
Njacob = zeros(Nbus);
Ljacob = zeros(Nbus);

for N1 = 1:Nbus
    
    for N2 = 1:Nbus
    
        if N1 ~= N2
            
            Hjacob(N1,N2) = -Hkm(N1,N2);
                
        elseif N1 == N2
            
            Hjacob(N1,N2) = -Hkk(N1);
            
        end
        
    end
    
end

for N1 = 1:Nbus
    
    for N2 = 1:Nbus
    
       if N1 ~= N2
           
           Mjacob(N1,N2) = -Mkm(N1,N2);
            
        elseif N1 == N2
            
            Mjacob(N1,N2) = -Mkk(N1);
            
        end
        
    end
    
end

for N1 = 1:Nbus
    
    for N2 = 1:Nbus
        
        if N1 ~= N2
            
            Njacob(N1,N2) = -Nkm(N1,N2);
                
        elseif N1 == N2
            
            Njacob(N1,N2) = -Nkk(N1);
                
        end
        
    end
    
end

for N1 = 1:Nbus
    
    for N2 = 1:Nbus
    
       if N1 ~= N2
            
            Ljacob(N1,N2) = -Lkm(N1,N2);
                 
        elseif N1 == N2
            
            Ljacob(N1,N2) = -Lkk(N1);
            
       end
        
    end
    
end

Jacob = [Hjacob, Njacob; Mjacob, Ljacob];

for N1 = 1:Nbus

    if Tipo(N1) == 1
        
        Jacob(:,N1 + Nbus) = 0;
        Jacob(N1 + Nbus,:) = 0;
        Jacob(N1 + Nbus,N1 + Nbus) = Inf;
    
    elseif Tipo(N1) == 0;
        
        Jacob(:,N1) = 0;
        Jacob(N1,:) = 0;
        Jacob(N1,N1) = Inf;
        
        Jacob(:,N1 + Nbus) = 0;
        Jacob(N1 + Nbus,:) = 0;
        Jacob(N1 + Nbus,N1 + Nbus) = Inf;
        
    end
    
end