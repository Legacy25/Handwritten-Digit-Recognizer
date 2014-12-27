function [X_train, T_train, X_validate] = split_data(X, ratio)

total_samples = size(X,1);
training_samples = round(ratio * total_samples);
validation_samples = total_samples - training_samples;
features = size(X,2) - 1;
classes = 10;

X_train = zeros(training_samples, features);
X_validate = zeros(validation_samples, features + 1);
T_train = zeros(training_samples, classes);

for i = 1:training_samples,
    X_train(i, :) = X(i, 1:features);
    T_train(i, (X(i,features+1)+1)) = 1;
end

for i = 1:validation_samples,
    X_validate(i, :) = X(training_samples+i, 1:features+1);
end

end