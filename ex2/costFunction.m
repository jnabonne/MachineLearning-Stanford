function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% number of parameters
n = size(X,2);

% ITERATIVE METHOD
Gite = zeros(size(theta)); sumG = zeros(size(theta));
Jite = 0; sumJ = 0; h = 0;
for i=1:m,
	% compute h with sigmoid/logistic function
	truc = 0;
	for j=1:n,
		truc += X(i,j) * theta(j);
	end;
	h = sigmoid(truc);

	% compute sum for cost function J
	sumJ += ( -y(i) * log(h) )  -  ( (1-y(i)) * log(1-h) );
	
	% compute sum for gradient(j)
	for j=1:n,
		sumG(j) += (h - y(i))' * X(i,j);
	end;
end;
% compute final value of cost function J
Jite    = 1/m * sumJ;
for j=1:n,
	Gite(j) = 1/m * sumG(j);
end;

% VECTORIZED METHOD
Gvec = zeros(size(theta)); Jvec = 0; 
h = sigmoid(X * theta);
% compute cost function J
Jvec = 1/m * (-y' * log(h)  -  (1-y)' * log(1-h));
% compute gradients for all j
for j=1:n,
	Gvec(j) = 1/m * (h-y)' * X(:,j);
end;


%if Jvec != Jite, sprintf('ERROR diff cost ite: %f Vs. vec: %f with theta:', Jite, Jvec), theta, end;

% choice between methods
J    = Jvec;
grad = Gvec;


% =============================================================

end
