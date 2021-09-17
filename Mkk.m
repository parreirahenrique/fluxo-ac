% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA REATIVA EM FUNCAO DE TETA EM QUE M = K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia reativa e o k-esimo angulo de fase

function [H] = Mkk(k)

global Nbus Vi Tetai Gbus Bbus


Gik = Gbus(k,1:Nbus);    
Bik = Bbus(k,1:Nbus);

H = -(Vi(k)^2)*Gik(k);
    
for m = 1:Nbus
    
    H = H + Vi(k)*Vi(m)*(Gik(m)*cos(Tetai(k) - Tetai(m)) + Bik(m)*sin(Tetai(k)-Tetai(m)));
    
end