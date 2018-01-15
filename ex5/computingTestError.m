function [error_train, error_val, error_test] = ...
    computingTestError(X, y, Xval, yval, Xtest, ytest, lambda)

% Number of training examples
m = size(X, 1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
error_test  = zeros(m, 1);

% ====================== YOUR CODE HERE ======================

[theta] = trainLinearReg(X, y, lambda);

error_train  = linearRegCostFunction(X,     y,     theta, lambda);
error_val    = linearRegCostFunction(Xval,  yval,  theta, 0);
error_test   = linearRegCostFunction(Xtest, ytest, theta, 0);

% =========================================================================
end
