% ---FUNCAO PARA VERIFICAR SE O ERRO ESTA DENTRO DO TOLERADO---

% Variaveis de entrada:
%Gx: funcao g(x), que calcula o erro do fluxo de potencia

function [Convergencia] = Convergencia(Gx)

global Nbus Tol Tipo

n = 1;

for L = 1:Nbus
    
    if Tipo(L) == 2
    
        K(n) = L;
        K(n + 1) = L + Nbus;
        
        n = n + 2;
    
    elseif Tipo(L) == 1
        
        K(n) = L;
        
        n = n + 1;
        
    end
    
end

for L = 1:(n - 1)
    
    if abs(Gx(K(L))) < Tol
        
        Convergencia = 'Converge';
        
    else
        
        Convergencia = 'Diverge';
        break
        
    end
    
end