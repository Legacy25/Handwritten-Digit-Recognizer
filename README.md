This is a project done as part of CSE 574 Introduction to Machine Learning taken by Professor Sargur Srihari at the University at Buffalo. The project is to implement classifiers to correctly recognize a test set of 1500 images of handwritten digits.

Features have been provided for the training and testing set using the GSC algorithm.

2 additional algorithms for feature extraction have been implemented. To run the feature extraction scripts, first unrar the two .rar files in the proj2data folder.

1. Structural	- Run featextract_structural.m (Needs the proj2data folder in the working directory and extracts the feature .txt files to feature_structural folder)
2. Zoning		- Run featextract_zoning.m (Needs the proj2data folder in the working directory and extracts the feature .txt files to feature_zoning folder)

The feature sets are contained in the feature, feature_structural and feature_zoning folders.

4 methods of classification have been implemented -

1. Logistic Regression
2. Neural Network
3. Neural Network using MATLAB's Neural Network Toolbox
4. Support Vector Machine using LIBSVM (http://www.csie.ntu.edu.tw/~cjlin/libsvm/)

1. Logistic Regression -

train_lr.m	- This is a function that takes an input set with target values and outputs the set of learned weights.
test_lr.m	- This is a function that takes an input set with target values and learned weights and outputs the error rate and predicted labels of the model.
logistic_regression.m	- This is a packaging script that loads data, performs training on the GSC features by default and tests on the testing set and prints the accuracy. To run it with the other feature sets, simply change the two lines of code -

				X = load_data('feature\features_train\');
				Y = load_data('feature\features_test\');
				
				to
				
				X = load_data('feature_structural\features_train\');
				Y = load_data('feature_structural\features_test\');
				
				or
				
				X = load_data('feature_zoning\features_train\');
				Y = load_data('feature_zoning\features_test\');
				
2. Neural Network -

train_nn.m	- This function takes as input the input vectors with target values and the number of neurons for the hidden layer and outputs the first layer weights (w1) and second layer weights (w2).
test_nn.m	- This function takes as input the two weight matrices computed above, the hidden layer size and the test set, and outputs the error rate and predicted labels.

neural_network.m	- This is a packaging script that load data, performs training and testing and prints the accuracy of the model. It runs with 400 as the default hidden layer size. This can be changed in the code.

3. Neural Network using MATLAB's Neural Network Toolbox

Simply run nn_model.m. This script uses MATLAB's built-in neural network toolbox to construct and train a two layer neural network and tests the model on the testing set. It outputs the predicted labels to the workspace and prints the accuracy.

4. Support Vector Machine using LIBSVM

Simply run svm.m. The script loads GSC feature data, trains using the svmtrain function, tests the model on the test data, prints the accuracy and saves the predicted labels to the workspace.
