function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% iterative method (valid for n features)
%S=0;
%for i=1:m,
%	h=0;
%	for j=1:size(X,2)
%		h += theta(j)*X(i,j);
%	end
%	S(i) = ( h - y(i) )^2;
%end;
%Jite = 1/(2*m) * sum(S);

% vector method
Jvec = 1/(2*m) * sum( (X * theta - y).^2 );

%if Jvec != Jite, sprintf('ERROR diff cost ite: %f Vs. vec: %f with theta:', Jite, Jvec), theta, end;

J = Jvec; % Jite OR Jvec methods

% =========================================================================

end
