% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA REATIVA EM FUNCAO DE TETA EM QUE M ~= K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia reativa
% m: variavel que indica o m-esimo angulo de fase

function [H] = Mkm(k,m)

global  Nbus Vi Tetai Gbus Bbus


Gik = Gbus(k,m);    
Bik = Bbus(k,m);

H = -Vi(k)*Vi(m)*(Gik*cos(Tetai(k) - Tetai(m)) + Bik*sin(Tetai(k) - Tetai(m)));