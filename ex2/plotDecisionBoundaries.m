function plotDecisionBoundaries(thetas, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

% Plot Data
plotData(X(:,2:3), y);

cmap = ['b', 'y', 'm', 'v', 'g', 'r'];

for nb=1:size(thetas,2),
    hold on 

    if size(X, 2) <= 3
        % Only need 2 points to define a line, so choose two endpoints
        plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

        % Calculate the decision boundary line
        plot_y(i) = (-1./thetas(3,nb)).*(thetas(2,nb).*plot_x + thetas(1,nb));

        % Plot, and adjust axes for better viewing
        plot(plot_x, plot_y(nb))

        % Legend, specific for the exercise
        legend('positive', 'negative', 'Decision Boundary')
        axis([30, 100, 30, 100])
    else
        % Here is the grid range
        u = linspace(-1, 1.5, 50);
        v = linspace(-1, 1.5, 50);

        z = zeros(length(u), length(v));
        % Evaluate z = theta*x over the grid
        for i = 1:length(u)
            for j = 1:length(v)
                z(i,j) = mapFeature(u(i), v(j))*thetas(:,nb);
            end
        end
        z = z'; % important to transpose z before calling contour

        % Plot z = 0
        % Notice you need to specify the range [0, 0]
        contour(u, v, z, [0, 0], 'LineWidth', 2, 'LineColor', cmap(nb))
    end
    hold off
end

end
