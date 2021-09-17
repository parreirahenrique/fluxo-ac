% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA REATIVA EM FUNCAO DA TENSAO EM QUE M ~= K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia reativa
% m: variavel que indica o m-esimo modulo da tensao

function [H] = Lkm(k,m)

global  Nbus Vi Tetai Gbus Bbus


Gik = Gbus(k,m);    
Bik = Bbus(k,m);

H = Vi(k)*(Gik*sin(Tetai(k) - Tetai(m)) - Bik*cos(Tetai(k)-Tetai(m)));