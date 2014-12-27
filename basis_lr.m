function phi = basis_lr(X)

N = size(X,1);
phi = [ones(N, 1) X];

% for n = 1:N, 
%     for m = 1:192,
%         phi(n, 2) = phi(n, 2) + X(n, m);
%         phi(n, 3) = phi(n, 3) + X(n, m+192);
%         if m <= 128,
%             phi(n, 4) = phi(n, 4) + X(n, m+384);
%         end
%     end
%     
%     phi(n, 2) = phi(n, 2) / 192;
%     phi(n, 3) = phi(n, 3) / 192;
%     phi(n, 4) = phi(n, 4) / 128;
% end

end