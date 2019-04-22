%DWT -- https://www.mathworks.com/help/wavelet/ref/wavedec.html
function [c_matrix, l_matrix] = m_dwt(datasets, wname, levels)
    dir_save = 'results/';
    [~, dimY, dimZ] = size(datasets); 
    
    c_matrix = [];
    l_matrix = [];
    %Para cada subset (A..E)
    for k=1:dimZ
        c_vector = [];
        l_vector = [];
        %Para cada canal (1..100)
        for j=1:dimY
            X = datasets(:,j,k);
            [c,l] = wavedec(X, levels, wname);
            %Example evaluate
            %approx = appcoef(c,l,wname);
            %[cd1,cd2,cd3,cd4,cd5] = detcoef(c,l,[1:levels]);
            c_vector = cat(2,c_vector,c);
            l_vector = cat(2,l_vector,l);
        end
        c_matrix = cat(3,c_matrix,c_vector);
        l_matrix = cat(3,l_matrix,l_vector);
    end
    name = [dir_save 'dwt.mat'];
    save(name, 'c_matrix', 'l_matrix');
end