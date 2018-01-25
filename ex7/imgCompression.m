%% Initialization
clear ; close all; clc

A = double(imread('dragon.png')); % load image to compress

A = A / 255; % mean normalization
img_size = size(A); % get img size
X = reshape(A, img_size(1) * img_size(2), 3); % reshape img into Nx3 matrix (N=nb pixels & rows coding RGB)

K = 64; % choose nb of color cluster
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K); % random init of clusters
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);
idx = findClosestCentroids(X, centroids);

X_recovered = centroids(idx,:); % recover img from idx to centroid value
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3); % reshape recovered img into proper dimensions

subplot(1, 2, 1), imagesc(A), title('Original'); % display org img
subplot(1, 2, 2), imagesc(X_recovered), title(sprintf('Compressed, with %d colors.', K)); % display compressed img

imwrite(X_recovered,'compressed.png', 'png') %save compressed image
