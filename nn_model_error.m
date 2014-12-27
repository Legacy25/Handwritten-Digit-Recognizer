function [predicted_label, error] = nn_model_error(net, Y_data, Y_labels)

T = net(Y_data')';
predicted_label = -1*ones(size(T, 1), 1);
error = 0;

for i = 1:size(Y_data, 1),
    [~, ind] = max(T(i, :));
    predicted_label(i, 1) = ind - 1;
    if Y_labels(i, ind) ~= 1
        error = error + 1;
    end
end
    
error = error / size(Y_data, 1);

end