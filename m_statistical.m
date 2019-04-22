function m_statistical(datasets)
    dir_save = 'results/';
    %[~, dimY, dimZ] = size(datasets); 
    
    %Mean
    m_means = mean(datasets);
    
    %Variance
    m_var = var(datasets);
    
    %Std
    m_std = std(datasets);
    
    %Kurtosis
    m_kurtosis = kurtosis(datasets);
        
    %Skewness
    m_skewness = skewness(datasets);
    
    %Max
    m_max = max(datasets);
    
    %Min
    m_min = min(datasets);
        
    name = [dir_save 'statistical.mat'];
    save(name, 'm_means', 'm_var', 'm_std', 'm_kurtosis', 'm_skewness', 'm_max', 'm_min');
end