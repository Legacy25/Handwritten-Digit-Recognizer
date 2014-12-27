% This is a packaging script for neural network. It loads data using
% the load_data script, trains the model using train_nn, and then computes
% the accuracy of the model using the test_lr script

clear;
X = load_data('feature\features_train\');
Y = load_data('feature\features_test\');

hiddenLayerSize = 400;              % Change this value to change the hidden layer size

[w1, w2] = train_nn(X, hiddenLayerSize);
[error, predicted_labels] = test_nn(w1, w2, hiddenLayerSize, Y);

fprintf('Accuracy: %3.2f percent\n', (100-error*100));