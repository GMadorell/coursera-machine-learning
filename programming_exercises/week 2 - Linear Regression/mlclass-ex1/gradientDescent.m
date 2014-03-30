function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
amount_theta = size(theta, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    predictions = X * theta;
    
    
    
    % Different implementations (from less to more vectorized).
    
%     % First implementation - No vectorization at all.
%     for i=1:amount_theta
%         sum = 0;
%         for j=1:m
%             sum = sum + (predictions(j, 1) - y(j, 1)) * X(j, i);
%         end
%         
%         theta(i) = theta(i) - alpha * (1/m) * sum;
%     end
    
%     % Second implementation - Inner loop vectorized.
%     for i=1:amount_theta        
%         sum = (predictions - y)' * X(:, i);       
%         theta(i) = theta(i) - alpha * (1/m) * sum;
%     end
    
    % Third implementation - Full vectorization.
    delta = X' * (predictions - y);
    theta = theta - alpha * (1/m) * delta;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
