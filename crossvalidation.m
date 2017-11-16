function c = crossvalidation(X, y)
options = optimoptions('fmincon','Display','off', 'TolCon', 1e-3,...
    'TolFun', 1e-3, 'TolX', 1e-3, 'Algorithm','interior-point');
f = @(lambda) icrossvalidation(X, y, lambda);
c = fmincon(f, 0.1, [], [], [], [], 0, 1,[], options);
end