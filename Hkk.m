% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA ATIVA EM FUNCAO DE TETA EM QUE M = K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia ativa e o k-esimo angulo de fase

function [H] = Hkk(k)

global  Nbus Vi  Tetai Gbus Bbus


Gik = Gbus(k,1:Nbus);    
Bik = Bbus(k,1:Nbus);

H = -(Vi(k)^2)*Bik(k);
    
for m = 1:Nbus
    
    H = H - Vi(k)*Vi(m)*(Gik(m)*sin(Tetai(k) - Tetai(m)) - Bik(m)*cos(Tetai(k) - Tetai(m)));
    
end