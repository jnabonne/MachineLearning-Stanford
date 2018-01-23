%% Initialization
clear ; close all; clc
num_labels = 10;

load('data10.mat'); % training data stored in arrays X, y

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Press enter to continue to pred.\n');
pause;


lambda
size(X)
size(y)
size(all_theta)

pred = predictOneVsAll(all_theta, X)

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

