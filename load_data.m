function X = load_data(folder)

X = [];

for i = 0:9,
    M = dlmread(strcat(folder, int2str(i), '.txt'));
    M = [M i*ones(size(M, 1), 1)];
    X = [X; M];
end

end