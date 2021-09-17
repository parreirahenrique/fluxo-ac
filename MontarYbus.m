global DadosLinha DadosBarra...
       Ybus Gbus Bbus Bsh SUCsh...
       Nbus Nlinhas...
       De Para

Bsh = i*DadosBarra(:,4);
De = DadosLinha(:,1);
Para = DadosLinha(:,2);
Z = DadosLinha(:,4) + i*DadosLinha(:,5);
SUCsh = i*DadosLinha(:,6);
Tap = DadosLinha(:,7);
Defasagem = DadosLinha(:,8)*2*pi/360;
LouD = DadosLinha(:,9);
Ybus = zeros(Nbus);

[Nlinhas, ~] = size(DadosLinha);

for L = 1:Nlinhas
        
    if LouD(L) == 1
        
        Ybus(De(L), Para(L)) = -(1/(Z(L)))*exp(-i*Defasagem(L))*Tap(L);
        Ybus(Para(L), De(L)) = -(1/(Z(L)))*exp(i*Defasagem(L))*Tap(L);
        Ybus(De(L), De(L)) = Ybus(De(L), De(L)) + (Tap(L)^2)*((1/Z(L)) + (SUCsh(L)/2));
        Ybus(Para(L), Para(L)) = Ybus(Para(L), Para(L)) + (1/Z(L)) + (SUCsh(L)/2);
        
    end
    
end

for L = 1:Nbus
    
    Ybus(L,L) = Ybus(L,L) + Bsh(L);
    
end

Gbus = real(Ybus);
Bbus = imag(Ybus);