function m_aux()
      
    %Diretório base dos datasets
    base_path = 'C:\Users\wallace\documents\mestrado\repo\eeg_features\results\emd_';
    %Pastas dos subsets
    folders = {'A_Z','B_O','C_N','D_F','E_S'};
    fs = 173.61;
   
    for folder = folders
        for i=1:100
            %Construindo os caminhos e listando os arquivos de eeg
            full_path = [base_path folder{1}(1) '_' int2str(i) '.mat'];
            struct_imf = load(full_path);
            
            dim = size(struct_imf.imf,2);
            maxY = 50 * ceil(max(struct_imf.imf(:,1))/50);
            for j=1:dim
                %Imprimindo imfs
                %plot_signals(struct_imf.imf(:,j), ['IMF' int2str(j) '_' folder{1}(1) '_' int2str(i)] , folder{1}(1), 'results', i, 'Imf', maxY);
            end
            %Imprimindo residual
            %plot_signals(struct_imf.residual, ['Residual_' folder{1}(1) '_' int2str(i)], folder{1}(1), 'results', i, 'Imf', maxY);
            %Extraindo features da residual;
            %ifq = instfreq(struct_imf.residual,fs);
            %mfq = meanfreq(struct_imf.residual,fs);
            
            %Limpando var
            clear struct_imf;
        end
    end
            
            
    
end