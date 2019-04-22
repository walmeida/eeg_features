%****************************************************************
% Programa: feature_extraction.m
% Este programa realiza o treinamento de uma rede perceptrons
% com uma camada intermediaria
% Data: 26/03/2019
% Autor: Wallace Almeida
%****************************************************************

%****************************************************************
% Parâmetros:
% 
%****************************************************************

function [X,Y] = feature_extraction()
    %Diretório base dos datasets
    base_path = '../../Orientacao/EEG_Feature_Extraction/201809/Primarios/databases/University_Bonn';
    %Pastas dos subsets
    folders = {'A_Z','B_O','C_N','D_F','E_S'};
    raw_datasets = [];
    lpf_datasets = [];
    
    for folder = folders
        %Construindo os caminhos e listando os arquivos de eeg
        full_path = [base_path '/' folder{1} '/'];
        search_pattern = [full_path '*.txt'];
        files = dir(search_pattern);
        X = [];
        Y = [];
        for i=1:length(files)
            %Carregando arquivos
            filename = [full_path files(i).name];
            file = load(filename);
            
            %RAW
            x = file;
            %Imprimindo dados brutos
            %plot_signals(x, files(i).name, folder{1}(1), i, 'Raw');
            
            %LBF
            %Aplicando lowpass-filter em 60Hz
            y = lowpassfilter(x, 4, 60, 173.61);
            %Imprimindo lowpass-filter
            %plot_signals(y, files(i).name, folder{1}(1), i, 'Lpf');
            
            X = [X,x];   %Raw
            Y = [Y,y];   %Lpf
            
        end
        raw_datasets = cat(3,raw_datasets,X);
        lpf_datasets = cat(3,lpf_datasets,Y);
    end
        
    save('input', 'raw_datasets', 'lpf_datasets');
 
end

function plot_signals(file, filebasename, folder, index, export_type)
    f = figure('visible', 'off');
    plot(1:length(file),file);
    xlim([0 length(file)])
    xlabel('Amostra');
    ylabel('Amplitude (mV)');
    str_title = [export_type ' EEG - Dataset ' folder ' - Channel ' int2str(index)];
    title(str_title);
    saveas(f,['plots/' export_type '/' filebasename '.png']);
    close(f);
end