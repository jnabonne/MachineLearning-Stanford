function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

values_C     = [0.01 0.03 0.1 0.3 1 3 10 30];
values_sigma = [0.01 0.03 0.1 0.3 1 3 10 30];

%values_C     = [0.1 0.3 1];
%values_sigma = [0.1 0.3 1];


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

errors = zeros(length(values_C)*length(values_sigma),3);
min_error=error_ij=9;
ite=0;

for i = 1:length(values_C)
	for j = 1:length(values_sigma)
	%   model = svmTrain(X, y, values_C(i), @linearKernel, 1e-3, 20); % to test without kernel
		model = svmTrain(X, y, values_C(i), @(x1, x2) gaussianKernel(x1, x2, values_sigma(j))); % train model with given C & sigma
		predictions = svmPredict(model, Xval); % compute predictions for CV inputs from trained model
		error_ij = mean(double(predictions ~= yval)); % compare model predictions with CV test

		errors(++ite,:) = [error_ij, values_C(i), values_sigma(j)]; % for debugging only, stores all values

		if error_ij < min_error % if better couple C/sigma, we keep it
			min_error = error_ij;
			C = values_C(i);
			sigma = values_sigma(j);
		end;
	end;
end;

% for debugging, prints all values
fprintf('Errors\t\t\tC\tsigma\n');
for i=1:ite
	fprintf(['%f\t%f\t%f\n'], errors(i,1), errors(i,2), errors(i,3));
end;



% =========================================================================

end
