% This is a packaging script for logistic regression. It loads data using
% the load_data script, trains the model using train_lr, and then computes
% the accuracy of the model using the error_lr script

clear;
X = load_data('feature\features_train\');
Y = load_data('feature\features_test\');

W = train_lr(X);
[error, predicted_labels] = test_lr(Y, W);

fprintf('Accuracy: %3.2f percent\n', (100-error*100));