% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA REATIVA EM FUNCAO DA TENSAO EM QUE M = K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia reativa e o k-esimo modulo da tensao

function [H] = Lkk(k)

global  Nbus Vi Tetai Gbus Bbus


Gik = Gbus(k,1:Nbus);    
Bik = Bbus(k,1:Nbus);

H = -Vi(k)*Bik(k);
    
for m = 1:Nbus
    
    H = H + Vi(m)*(Gik(m)*sin(Tetai(k) - Tetai(m)) - Bik(m)*cos(Tetai(k)-Tetai(m)));
    
end