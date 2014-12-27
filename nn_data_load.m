X = load_data('feature\features_train\');
Y = load_data('feature\features_test\');

X = X(randperm(size(X, 1)),:);

X_data = X(:, 1:512);
X_labels = zeros(19978, 10);
Y_data = Y(:, 1:512);
Y_labels = zeros(1500, 10);

for i = 1:19978,
    X_labels(i, X(i, 513)+1) = 1;
    if i <= 1500,
        Y_labels(i, Y(i, 513)+1) = 1;
    end
end