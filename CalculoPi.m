% ---FUNCAO PARA O CALCULO DA POTENCIA ATIVA LIQUIDA---

% Variaveis de entrada:
% i: contador que indica o fluxo de potencia ativa sendo calculado

function [P] = CalculoPi(i)

global  Nbus Vi  Tetai Gbus Bbus

Gik = Gbus(i, 1:Nbus); % Matriz de condutancia do sistema
Bik = Bbus(i, 1:Nbus); % Matriz de susceptancia do sistema

P = 0;

for k = 1:Nbus
    
    P = P + Vi(i)*Vi(k)*(Gik(k)*cos(Tetai(i) - Tetai(k)) + Bik(k)*sin(Tetai(i) - Tetai(k)));
    
end