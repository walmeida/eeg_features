function m_statistical(datasets)
    dir_save = 'results/';
    %[~, dimY, dimZ] = size(datasets); 
    
    %Mean
    m_means = mean(datasets);
    name = [dir_save 'means.mat'];
    save(name, 'm_means');
        
end