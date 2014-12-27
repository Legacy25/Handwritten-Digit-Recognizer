% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by Neural Pattern Recognition app
% Created Thu Nov 27 20:34:23 EST 2014

clear;

% Loading input data
nn_data_load;

x = X_data';
t = X_labels';

% Create a Pattern Recognition Network
hiddenLayerSize = 250;
net = patternnet(hiddenLayerSize);


% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 85/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 5/100;


% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
[predicted_labels, error] = nn_model_error(net, Y_data, Y_labels);
fprintf('Accuracy: %3.2f percent\n', (100-error*100));
