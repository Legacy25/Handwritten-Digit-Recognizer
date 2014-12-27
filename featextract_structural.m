features = 64;

for i = 0:9,
    files = dir(strcat('proj2data\Numerals\', num2str(i), '\*.png'));
    N = size(files, 1);
    M = zeros(N, features);
    for j = 1:N,
        im = imread(strcat('proj2data\Numerals\', num2str(i), '\', files(j).name), 'png');
        im = imresize(im, [32, 32]);
        bw = im2bw(im);
        bw = 1 - bw;
        
        M(j, 1:32) = sum(bw);
        M(j, 33:64) = sum(bw');
    end
    M(:, 1:64) = M(:, 1:64) / 32;
    dlmwrite(strcat('feature_structural\features_train\', num2str(i), '.txt'), M, '\t');
end

for i = 9:-1:0,
    files = dir('proj2data\Test\*.png');
    M = zeros(150, features);
    for j = 1:150,
        im = imread(strcat('proj2data\Test\', files(((9-i)*150)+j).name), 'png');
        im = imresize(im, [32, 32]);
        bw = im2bw(im);
        bw = 1 - bw;
        
        M(j, 1:32) = sum(bw);
        M(j, 33:64) = sum(bw');
    end
    M(:, 1:64) = M(:, 1:64) / 32;
    dlmwrite(strcat('feature_structural\features_test\', num2str(i), '.txt'), M, '\t');
end