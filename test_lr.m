function [error, predicted_labels] = test_lr(Y, W)

N = size(Y, 1);
M = size(Y, 2);
phi = basis_lr(Y(:, 1:M-1));
predicted_labels = -1*ones(N, 1);

for n = 1:N,
    max_prob = 0;
    for k = 1:10,
        y_nk = exp(W(:, k)' * phi(n, :)');
        y_nk_den = 0;
        for j = 1:10,
            y_nk_den = y_nk_den + exp(W(:, j)' * phi(n, :)');
        end
        y_nk = y_nk / y_nk_den;
        if max_prob < y_nk,
            max_prob = y_nk;
            predicted_labels(n, 1) = k-1;
        end
    end    
end

error = nnz(predicted_labels - Y(:, M)) / N;

end