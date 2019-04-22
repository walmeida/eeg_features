function m_fft(datasets)
    dir_save = 'results/';
     %[~, dimY, dimZ] = size(datasets); 
    
    %FFT
    m_fft = fft(datasets);
    
    %TODO aplicar FE sobre o conjugado. FFT possui amplitude e fase
        
    name = [dir_save 'fft.mat'];
    save(name, 'm_fft');
end