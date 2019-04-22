%EMD -- https://www.mathworks.com/help/signal/ref/emd.html
function m_emd(datasets)
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
            save(name, 'imf', 'residual');
        end
    end
end