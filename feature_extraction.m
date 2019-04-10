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

function [A,B] = feature_extraction()
    %Diretório base dos datasets
    base_path = '../../Orientacao/EEG_Feature_Extraction/201809/Primarios/databases/University_Bonn';
    %Pastas dos subsets
    folders = {'A_Z','B_O','C_N','D_F','E_S'};
    datasets = [];
    
    for folder = folders
        %Construindo os caminhos e listando os arquivos de eeg
        full_path = [base_path '/' folder{1} '/'];
        search_pattern = [full_path '*.txt'];
        files = dir(search_pattern);
        X = [];
        Y = [];
        Z = [];
        for i=1:length(files)
            %Carregando arquivos
            filename = [full_path files(i).name];
            file = load(filename);
            
            %RAW
            %Imprimindo dados brutos
            %plot_signals(file, files(i).name, folder{1}(1), i, 'Raw');
            
            %LBF
            %Aplicando lowpass-filter em 60Hz
            y = lowpassfilter(file, 4, 60, 173.61);
            %Imprimindo lowpass-filter
            plot_signals(y, files(i).name, folder{1}(1), i, 'Lpf');
            
            %EMD
            %Aplicando EMD
            %imfs = emd_old(file, length(file), 173.61);
            %Imprimindo imfs
            %for j=1:size(imfs,1)
            %    imf = imfs(j,:)'; 
            %    plot_signals(imf, files(i).name, folder{1}(1), i, 'EMD');
            %end
            
            X = [X,file];   %Raw
            Y = [Y,y];      %Lpf
            %Z = [Z,z];      %EMD
        end
        datasets = cat(3,datasets,X);
    end
    
    %m_means = mean(datasets);
    %save all;
    
    A = datasets;
    B = 2;
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