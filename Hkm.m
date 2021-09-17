% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA ATIVA EM FUNCAO DE TETA EM QUE M ~= K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia ativa
% m: variavel que indica o m-esimo angulo de fase

function [H] = Hkm(k,m)

global  Vi  Tetai Gbus Bbus


Gik = Gbus(k,m);    
Bik = Bbus(k,m);

H = Vi(k)*Vi(m)*(Gik*sin(Tetai(k) - Tetai(m)) - Bik*cos(Tetai(k) - Tetai(m)));