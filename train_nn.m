function [w1, w2] = train_nn(X_input, hiddenLayerSize)

% X_input(:, 1:512) = X_input(:, 1:512) * 2 - 1;
X = X_input(randperm(size(X_input, 1)),:);
[X_train, T_train, X_validate] = split_data(X, 0.8);

N = size(X_train, 1);

w1 = rand(hiddenLayerSize, 513) * 2 - 1;
w2 = rand(10, hiddenLayerSize+1) * 2 - 1;

eta = 0.001;
error = 1;

for n = 1:N,
    [az1, az2] = feed_forward(w1, w2, hiddenLayerSize, X_train(n, :));
    delta2 = az2(2, :) - T_train(n, :); % 1x10 matrix
    delta1 = (1 - tanh(az1(1, :)).^2) .* (w2(:, 1:hiddenLayerSize)' * delta2')'; % 1xhL matrix
    
    for j = 1:hiddenLayerSize,
        for i = 1:512,
            w1(j, i) = w1(j, i) - eta * delta1(1, j) * X_train(n, i);
        end
        w1(j, 513) = w1(j, i) - eta * delta1(1, j);
    end
    
    for j = 1:10,
        for i = 1:hiddenLayerSize,
            w2(j, i) = w2(j, i) - eta * delta2(1, j) * az1(1, i);
        end
        w2(j, 11) = w2(j, i) - eta * delta2(1, j);
    end
    
    if mod(n, 3000) == 0,
        [error_new, ~] = test_nn(w1, w2, hiddenLayerSize, X_validate);
        if error - error_new < 0.0000001,
            break;
        end
        error = error_new;
    end
    
    fprintf('Iter: %d\n', n);
end

end