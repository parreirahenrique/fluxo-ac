% Disciplina: Analise de Sistemas Eletricos de Potencia II
% Professor: Fernando Assis
% Alunos: Dario Henrique Mota Losqui   Matricula: 130950097
%         Henrique Parreira Castro                150950052
%         Thais Larissa Palma Soares              150950045

clear all, clc;

% ---INICIAR VARIAVEIS---

global DadosBarra DadosLinha...
       Nbus Nlin Npq k...
       Sbase Tol MaxIt...
       Vi  Tetai Bc Bsh Pi Qi Pl Ql Tipo Ybus Gbus Bbus...
       Pli Qli DeltaPi DeltaQi...
       Jacob X0 X1 Gx

Tol = 0.0001;

LeituraDados % Carrega as informaçoes sobre as barras e linhas de transmissao do sistema

[Nbus, ~] = size(DadosBarra);

% ---MONTANDO A YBUS---

MontarYbus % Monta a Ybus com base nos dados fornecidos


Vi(1:Nbus) = DadosBarra(:, 6);                    % Vetor de tensoes nas barras
Vi = Vi';

for N = 1:Nbus
    
   if Vi(N) == 0
       
       Vi(N) = 1;
       
   end
    
end

Tetai(1:Nbus) = DadosBarra(:,7);                  % Vetor de angulo de fase das tensoes
Tetai = Tetai';
Pl(1:Nbus) = DadosBarra(:, 2);
Pi(1:Nbus) = DadosBarra(:, 8) - DadosBarra(:, 2); % Vetor de potencia ativa liquida injetada
Ql(1:Nbus) = DadosBarra(:, 3);
Qi(1:Nbus) = DadosBarra(:, 9) - DadosBarra(:, 3);                   % Vetor de potencia reativa liquida injetada
Tipo(1:Nbus) = DadosBarra(:, 5);                  % Vetor do tipo de barra                                  

DeltaPi(1:Nbus, 1) = 0;                              % Vetor para a potencia ativa liquida calculada
DeltaQi(1:Nbus, 1) = 0;                              % Vetor para a potencia reativa liquida calculada
Jacob = zeros(2*Nbus);                            % Matriz jacobiana de g(x)

% ---DEFINIR CONTADOR DE BARRAS DO TIPO PQ---

Npq = 0; % Contador para numero de barras do tipo PQ

for L = 1:Nbus % Conta quantas barras do tipo PQ há no sistema
    
    if Tipo(L) == 0
        
        Npq = Npq + 1;
        
    end
    
end

% ---INÍCIO DAS ITERACOES---

Erro = 'Diverge';
Iteracao = 1;

while strcmp(Erro, 'Diverge') == 1 % Iteracoes sao repetidas ate que o erro esteja abaixo do tolerado
    
    X = [Tetai; Vi];
    
    % ---CALCULO DA POTENCIA INJETADA NA BARRA---
    for L = 1:Nbus
        
        Qli = CalculoQi(L);
        DeltaQi(L) = Qi(L) - Qli;
        
        Pli = CalculoPi(L);
        DeltaPi(L) = Pi(L) - Pli;
        
    end
    
    % ---OBTER G(X)---
    
    Gx = [DeltaPi; DeltaQi];
    
    % ---TESTE DE CONVERGENCIA DO ERRO---
    Erro = Convergencia(Gx);        % Ve se o resultado converge ou diverge ao valor de tolerancia
        
    % ---CALCULAR O JACOBIANO DA ITERACAO ATUAL---
    Jacobiano                       % Monta a matriz jacobiana da iteracao atual
    
    % ---OBTER O VETOR DAS VARIAVEIS DA PROXIMA ITERACAO---
    X = X - Jacob\Gx;
    
    Tetai = X(1:Nbus);
    Vi = X((1 + Nbus):2*Nbus);
    
    Iteracao = Iteracao + 1;
    
end

% ---DISPOSICAO DOS RESULTADOS OBTIDOS---
MostrarResultados 