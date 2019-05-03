function process_features(full_datasets)
    datasets = full_datasets(2:length(full_datasets),:,:);
    
    %Mean e etc.
    disp('Processando Statistical Features...');
    m_statistical(datasets);

    %DWT -- https://www.mathworks.com/help/wavelet/ref/wavedec.html
    disp('Processando DWT...');
    [c_matrix, l_matrix] = m_dwt(datasets,'Db4',5);
    
    %EMD -- https://www.mathworks.com/help/signal/ref/emd.html
    disp('Processando EMD...');
    m_emd(datasets, 173.61);
   
end