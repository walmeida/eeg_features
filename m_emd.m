%EMD -- https://www.mathworks.com/help/signal/ref/emd.html
function m_emd(datasets, fs)
    dir_save = 'results/';
    folders = {'A_Z','B_O','C_N','D_F','E_S'};
    [~, dimY, dimZ] = size(datasets); 
    
    %Para cada subset (A..E)
    for k=1:dimZ
        %Para cada canal (1..100)
        for j=1:dimY
            X = datasets(:,j,k);
            [imf,residual] = emd(X,'Interpolation','spline','Display',0);
            name = [dir_save 'emd_' folders{k}(1) '_' int2str(j) '.mat'];
            %save(name, 'imf', 'residual');
            
            nimfs = size(imf,2);
            if_vector = [];
            mf_vector = [];
            
            for i=1:nimfs
                ifq = instfreq(imf(:,i),fs);
                mfq = meanfreq(imf(:,i),fs);
                if_vector = cat(2,if_vector,ifq);
                mf_vector = cat(2,mf_vector,mfq);
            end
            
            ifq = instfreq(residual,fs);
            mfq = meanfreq(residual,fs);
            if_vector = cat(2,if_vector,ifq);
            mf_vector = cat(2,mf_vector,mfq);
            
            name = [dir_save 'stats_imfs_' folders{k}(1) '_' int2str(j) '.mat'];
            save(name, 'if_vector', 'mf_vector');
        end
    end
end