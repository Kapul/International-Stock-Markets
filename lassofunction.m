function b = lassocoef(X, y, lambda)
k = size(X,2);
n = size(X, 1);
a = sqrt(n-1)*sqrt(var(X));
sy = sqrt(var(y))*sqrt(n-1);
y_tilde = (y - mean(y))/sy;
X_tilde = bsxfun(@minus, X, mean(X));
X_tilde = bsxfun(@rdivide, X_tilde, a);

b = zeros(1, k);
condition = true;

if lambda < 1e-3
    b = inv(X_tilde'*X_tilde)*X_tilde'*y;
    b = b';
else
    while condition
        b_old = b;
        for i = 1:k
            X_temp = X_tilde;
            X_temp(:,i) = [];
            b_temp = b';
            b_temp(i) = [];
            r = y_tilde - X_temp*b_temp;
            b_hat = r'*X_tilde(:,i);
            b(i) = sign(b_hat)*max(abs(b_hat)-lambda,0);
        end
        condition = not(all(abs(b_old-b)<1e-3));
    end
end

c = b./a*sy;
b = [mean(y)-mean(X)*c', c];
end
