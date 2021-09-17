% ---FUNCAO PARA O CALCULO DA POTENCIA REATIVA LIQUIDA---

% Variaveis de entrada:
% i: contador que indica o fluxo de potencia reativa sendo calculado

function [Q] = CalculoQi(i)

global  Nbus Vi  Tetai Gbus Bbus

Gik = Gbus(i, 1:Nbus); % Matriz de condutancia do sistema
Bik = Bbus(i, 1:Nbus); % Matriz de susceptancia do sistema

Q = 0;

for k = 1:Nbus
    
    Q = Q + Vi(i)*Vi(k)*(Gik(k)*sin(Tetai(i)-Tetai(k)) - Bik(k)*cos(Tetai(i) - Tetai(k)));
    
end