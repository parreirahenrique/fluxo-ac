% ---FUNCAO PARA CALCULAR AS DERIVADAS PARCIAIS DA POTENCIA ATIVA EM FUNCAO DA TENSAO EM QUE M ~= K---

% Variaveis de entrada:
% k: variável que indica o k-esimo fluxo de potencia ativa
% m: variavel que indica o m-esimo modulo da tensao

function [H] = Nkm(k,m)

global  Nbus Vi Tetai Gbus Bbus


Gik = Gbus(k,m);    
Bik = Bbus(k,m);

H = Vi(k)*(Gik*cos(Tetai(k) - Tetai(m)) + Bik*sin(Tetai(k) - Tetai(m)));