%****************************************************************
% Este programa realiza o treinamento de uma rede perceptrons
% com uma camada intermediaria
% Data: 26/03/2019
% Autor: Wallace Almeida
%****************************************************************

%****************************************************************
% X : Matriz de entrada (N x ne = instantes de tempo x entradas)
% Yd: Matriz de resultados esperados (N x 1)
% A : Matriz de pesos input_x_hidden (h x ne+1)
% B : Matriz de pesos hidden_x_output (ns x h+1)
% h : número de neurônios na camada escondida
%****************************************************************

function [A,B] = feature_extraction()
    %Diretório base dos datasets
    base_path = '../../Orientacao/EEG_Feature_Extraction/201809/Primarios/databases/University_Bonn';
    %Pastas dos subsets
    folders = {'A_Z','B_O','C_N','D_F','E_S'};
    
    
        
    for folder = folders
        %Construindo os caminhos e listando os arquivos de eeg
        full_path = [base_path '/' folder{1} '/'];
        search_pattern = [full_path '*.txt'];
        files = dir(search_pattern);
        
        for i=1:1%length(files)
            file = [full_path files(i).name];
            disp(file);
            
        end
    end
    
    
    %cj = load(strcat(base_path,folder,arquivo));
    A = 1;
    B = 2;
end

