function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% dummy double loop version with
%for i=1:length(X)
%	idx(i) = 1;
%	best = sum( (X(i,:) - centroids(1,:) ).^2 );
%	for j=1:K
%		distance = sum( ( X(i,:) - centroids(j,:) ).^2 );
%		if distance < best
%			best = distance;
%			idx(i) = j;
%		end;
%	end;
%end;

% less dummy double loop version with global final test
%distances = zeros(size(X,1), K);
%for i=1:length(X)
%	for j=1:K
%		distances(i,j) = sum( ( X(i,:) - centroids(j,:) ).^2 );
%	end;
%end;
%[val, idx] = min(distances');
%idx = idx(:);

% optimized in one loop 
for k=1:K,
	distance = X - centroids(k,:);
	distance = sum(distance.^2, 2);
	distances(:,k) = distance';
end;
[val, idx] = min(distances');
idx = idx(:);

% =============================================================

end

