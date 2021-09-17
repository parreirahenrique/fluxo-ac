global DadosBarra DadosLinha...
       Nbus Nlinhas Npq kT kV...
       Sbase Tol MaxIt...
       Vi  Tetai Bsh Pi Qi Pl Ql Tipo Ybus Gbus Bbus SUCsh...
       Pli Qli DeltaPi DeltaQi...
       De Para

clc;

% ---CALCULO DO FLUXO DE POTENCIA ENTRE AS LINHAS---

for N = 1:Nlinhas

    Pik(N) = -Vi(De(N))^2*Gbus(De(N),Para(N)) +...
        Vi(De(N))*Vi(Para(N))*(Gbus(De(N),Para(N))*cos(Tetai(De(N)) - Tetai(Para(N))) + Bbus(De(N),Para(N))*sin(Tetai(De(N)) - Tetai(Para(N))));
    
    Pki(N) = -Vi(Para(N))^2*Gbus(Para(N),De(N)) +...
        Vi(Para(N))*Vi(De(N))*(Gbus(Para(N),De(N))*cos(Tetai(Para(N)) - Tetai(De(N))) + Bbus(Para(N),De(N))*sin(Tetai(Para(N)) - Tetai(De(N))));
    
    Qik(N) = Vi(De(N))^2*Bbus(De(N),Para(N)) - Vi(De(N))^2*SUCsh(De(N)) +...
        Vi(De(N))*Vi(Para(N))*(Gbus(De(N),Para(N))*sin(Tetai(De(N)) - Tetai(Para(N))) - Bbus(De(N),Para(N))*cos(Tetai(De(N)) - Tetai(Para(N))));
    
    Qki(N) = Vi(Para(N))^2*Bbus(Para(N),De(N)) - Vi(Para(N))^2*SUCsh(Para(N)) +...
        Vi(Para(N))*Vi(De(N))*(Gbus(Para(N),De(N))*sin(Tetai(Para(N)) - Tetai(De(N))) - Bbus(Para(N),De(N))*cos(Tetai(Para(N)) - Tetai(De(N))));

end

PiVA = Pi;  % Potencia ativa injetada na barra em MW
QiVAr = Qi; % Potencia reativa injetada na barra em MVAr

Saida = fopen('Dados_Saida.txt', 'wt');

fprintf(Saida, 'INFORMACOES DAS BARRAS:\n\n');
fprintf(Saida, ' Barra   Tensao [pu]   Fase [rad]   Pi [pu]   Qi [pu]   Pg [pu]   Qg [pu]   Bc [pu]\n');
fprintf(Saida, '+-----+ +-----------+ +----------+ +-------+ +-------+ +-------+ +-------+ +-------+\n');

for N = 1:Nbus
    
    Pi = CalculoPi(N);
    Qi = CalculoQi(N);
    Pg = Pi + Pl(N);
    Qg = Qi + Ql(N);
    
    %Pegando apenas a variavel a ser mostrada na atual iteracao
    ViN = Vi(N)*10000;       
    TetaiN = Tetai(N)*10000;
    PiN = Pi*10000;
    QiN = Qi*10000;
    BshN = Bsh(N)*10000;
    PgN = Pg*10000;
    QgN = Qg*10000;
    
    % Arredondando a variavel para quatro casas decimais
    ViN = round(ViN);       
    TetaiN = round(TetaiN);
    PiN = round(PiN);
    QiN = round(QiN);
    BshN = round(BshN);
    PgN = round(PgN);
    QgN = round(QgN);
    
    ViN = ViN/10000;       
    TetaiN = TetaiN/10000;
    PiN = PiN/10000;
    QiN = QiN/10000;
    BshN = BshN/(10000*i);
    PgN = PgN/10000;
    QgN = QgN/10000;
    
    % Criando uma variavel string da variavel a ser mostrada na atual iteracao
    Vistr = num2str(ViN);
    Tetaistr = num2str(TetaiN);
    Pistr = num2str(PiN);
    Qistr = num2str(QiN);
    Bcstr = num2str(BshN);
    PgN = num2str(PgN);
    QgN = num2str(QgN);
    
    % Fazendo com que todos os strings tenham o mesmo tamanho
    Vistr = Dimensionar(Vistr);
    Tetaistr = Dimensionar(Tetaistr);
    Pistr = Dimensionar(Pistr);
    Qistr = Dimensionar(Qistr);
    Bcstr = Dimensionar(Bcstr);
    PgN = Dimensionar(PgN);
    QgN = Dimensionar(QgN);
    
    % Mostrando o resultado
    fprintf(Saida, '   %g       %s      %s     %s   %s   %s   %s   %s\n', N, Vistr, Tetaistr, Pistr, Qistr, PgN, QgN, Bcstr);
    
end

fprintf(Saida, '\n\n');

fprintf(Saida, 'INFORMACOES DAS LINHAS DE TRANSMISSAO:\n\n');

fprintf(Saida, ' De   Para   Pik [pu]   Qik [pu]   Pki [pu]   Qki [pu]    Perdas At. [pu]\n');
fprintf(Saida, '+--+ +----+ +--------+ +--------+ +--------+ +--------+  +---------------+\n');

for N = 1:Nlinhas
    
    %Pegando apenas a variavel a ser mostrada na atual iteracao
    PikN = Pik(N);       
    QikN = Qik(N);
    PkiN = Pki(N);
    QkiN = Qki(N);
    PerdasAt = Pik(N) + Pki(N);
    
    PikN = PikN*10000;
    QikN = QikN*10000;
    PkiN = PkiN*10000;
    QkiN = QkiN*10000;
    PerdasAt = PerdasAt*10000;
    
    % Arredondando a variavel para quatro casas deciamsi
    PikN = round(PikN);       
    QikN = round(QikN);
    PkiN = round(PkiN);
    QkiN = round(QkiN);
    PerdasAt = round(PerdasAt);
    
    PikN = PikN/10000;
    QikN = QikN/10000;
    PkiN = PkiN/10000;
    QkiN = QkiN/10000;
    PerdasAt = PerdasAt/10000;
    
    % Criando uma variavel string da variavel a ser mostrada na atual iteracao
    PikN = num2str(PikN);
    QikN = num2str(QikN);
    PkiN = num2str(PkiN);
    QkiN = num2str(QkiN);
    PerdasAt = num2str(PerdasAt);
    
    % Fazendo com que todos os strings tenham o mesmo tamanho
    PikN = Dimensionar(PikN);
    QikN = Dimensionar(QikN);
    PkiN = Dimensionar(PkiN);
    QkiN = Dimensionar(QkiN);
    PerdasAt = Dimensionar(PerdasAt);
    
    % Mostrando o resultado
    fprintf(Saida, '  %g     %g     %s    %s    %s    %s        %s\n', De(N), Para(N), PikN, QikN, PkiN, QkiN, PerdasAt);
    
end

fprintf(Saida, '\n');
fclose(Saida);