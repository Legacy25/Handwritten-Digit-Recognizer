function [az1, az2] = feed_forward(w1, w2, hiddenLayer, X_input)

az1 = zeros(2, hiddenLayer);
az2 = zeros(2, 10);

for j = 1:hiddenLayer,
    az1(1, j) = w1(j, :)*[X_input'; 1];
    az1(2, j) = tanh(az1(1, j));
end

for j = 1:10,
    az2(1, j) = w2(j, :)*[az1(1, :)'; 1];
    az2(2, j) = (1 + exp(-az2(1, j)))^-1;
end

end