global DadosBarra DadosLinha

Arquivo = uigetfile('.txt');
Dados = fopen(Arquivo); % Abre o arquivo para leitura

for N = 1:3
    
    fgetl(Dados);
    
end

Line = fgetl(Dados);

N = 1;

while strcmp(Line(1:4), '####') == 0
    
    if strcmp(Line (34:35), 'SW') == 1
        
        Line (34:35) = '00';
        
    elseif strcmp(Line (34:35), 'PV') == 1
        
        Line (34:35) = '01';
        
    elseif strcmp(Line (34:35), 'PQ') == 1
        
        Line (34:35) = '02';
        
    end
    
    Line = str2num(Line);
    DadosBarra(N,:) = Line;
    
    N = N + 1;
    
    Line = fgetl(Dados);
    
end

for N = 1:4
    
    fgetl(Dados);
    
end

Line = fgetl(Dados);

N = 1;

while strcmp(Line(1:4), '####') == 0
    
    if strcmp(Line (79), 'L') == 1
        
        Line (79) = '1';
        
    else
        
        Line (79) = '0';
        
    end
    
    Line = str2num(Line);
    DadosLinha(N,:) = Line;
    
    N = N + 1;
    
    Line = fgetl(Dados);

end

fclose('all');