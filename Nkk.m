% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA ATIVA EM FUNCAO DA TENSAO EM QUE M = K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia ativa e o k-esimo modulo da tensao

function [H] = Nkk(k)

global  Nbus Vi Tetai Gbus Bbus


Gik = Gbus(k,1:Nbus);    
Bik = Bbus(k,1:Nbus);

H = Vi(k)*Gik(k);
    
for m = 1:Nbus
    
    H = H + Vi(m)*(Gik(m)*cos(Tetai(k) - Tetai(m)) + Bik(m)*sin(Tetai(k)-Tetai(m)));
    
end