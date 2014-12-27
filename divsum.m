function sumstruct = divsum(A, M, N)

sumstruct = cell(1, M*N);
k = 1;
[a, b] = size(A);
den = (a/M * b/N);

for i = 1:M,
    for j = 1:N,
        if i * round(a/M) > a,
            if j * round(b/N) > b,
                sumstruct{1, k} = sum(sum(A((i-1)*round(a/M) + 1:end, (j-1)*round(b/N) + 1:end)))/den;
            else
                sumstruct{1, k} = sum(sum(A((i-1)*round(a/M) + 1:end, (j-1)*round(b/N) + 1:j*round(b/N))))/den;
            end
        else
            if j * round(b/N) > N,
                sumstruct{1, k} = sum(sum(A((i-1)*round(a/M) + 1:i*round(a/M), (j-1)*round(b/N) + 1:end)))/den;
            else
                sumstruct{1, k} = sum(sum(A((i-1)*round(a/M) + 1:i*round(a/M), (j-1)*round(b/N) + 1:j*round(b/N))))/den;
            end
        end
        k = k+1;
    end
end
    
end