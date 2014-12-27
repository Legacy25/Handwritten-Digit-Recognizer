features = 123;

for i = 0:9,
    files = dir(strcat('proj2data\Numerals\', num2str(i), '\*.png'));
    N = size(files, 1);
    M = zeros(N, features);
    for j = 1:N,
        im = imread(strcat('proj2data\Numerals\', num2str(i), '\', files(j).name), 'png');
        bw = im2bw(im);
        bw = 1 - bw;
        
        k = 1;
        ca = divsum(bw, 3, 1);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 1, 3);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 2, 3);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 3, 2);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 3, 3);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 1, 4);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 4, 1);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 4, 4);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 6, 1);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 1, 6);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 6, 2);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 2, 6);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 6, 6);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
    end
    dlmwrite(strcat('feature_zoning\features_train\', num2str(i), '.txt'), M, '\t');
end

for i = 9:-1:0,
    files = dir('proj2data\Test\*.png');
    M = zeros(150, features);
    for j = 1:150,
        im = imread(strcat('proj2data\Test\', files(((9-i)*150)+j).name), 'png');
        bw = im2bw(im);
        bw = 1 - bw;
        
        k = 1;
        ca = divsum(bw, 3, 1);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 1, 3);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 2, 3);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 3, 2);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 3, 3);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 1, 4);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 4, 1);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 4, 4);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 6, 1);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 1, 6);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 6, 2);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 2, 6);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
        
        ca = divsum(bw, 6, 6);
        for l = 1:size(ca, 2),
            M(j, k) = ca{1, l};
            k = k+1;
        end
    end
    dlmwrite(strcat('feature_zoning\features_test\', num2str(i), '.txt'), M, '\t');
end