function [error, predicted_labels] = test_nn(w1, w2, hiddenLayerSize, Y)

N = size(Y, 1);
predicted_labels = -1*ones(N, 1);
error = 0;

for n = 1:N,
    [~, az2] = feed_forward(w1, w2, hiddenLayerSize, Y(n, 1:512));
    [~, ind] = max(az2(2, :));
    predicted_labels(n, 1) = ind-1;
    if ind-1 ~= Y(n, 513),
        error = error + 1;
    end
end

error = error/N;

end