function W = train_lr(X_input)

X = X_input(randperm(size(X_input, 1)),:);
[X_train, T_train, X_validate] = split_data(X, 0.8);

N = size(T_train, 1);
K = size(T_train, 2);
phi_train = basis_lr(X_train);
M = size(phi_train, 2);
W = zeros(M, K);
eta = 0.001;
error = 1;

for n = 1:N,
    for k = 1:K,
        y_nk = exp(W(:, k)' * phi_train(n, :)');
        y_nk_den = 0;
        for j = 1:K,
            y_nk_den = y_nk_den + exp(W(:, j)' * phi_train(n, :)');
        end
        y_nk = y_nk / y_nk_den;
        delta = (eta * (y_nk - T_train(n, k)) * phi_train(n, :))';
        W(:, k) = W(:, k) - delta;
    end
    if mod(n, 2000) == 0,
        [error_new, ~] = test_lr(X_validate, W);
        if (error - error_new) < 0.0001,
            break;
        end
    end
end

end