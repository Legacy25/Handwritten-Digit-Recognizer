clear;

X = load_data('feature\features_train\');
Y = load_data('feature\features_test\');

features = size(X, 2) - 1;

model = svmtrain(X(:, features+1), X(:, 1:features));
[predicted_label, accuracy, decision_values] = svmpredict(Y(:, features+1), Y(:, 1:features), model);