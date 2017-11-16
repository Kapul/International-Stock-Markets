function c = icrossvalidation(X, y, lambda)
n = length(y);
%lambda
for i = 1:n
    %i
    X_temp = X;
    X_temp(i,:) = [];
    y_temp = y;
    y_temp(i) = [];
    b = lassocoef(X_temp, y_temp, lambda);
    e(i) = y(i) - b(1) - X(i,:)*b(2:end)';
end
c = sum(e.^2);
end