function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

predictions = X * theta;
J = 1/(2*m) * sum((predictions - y) .^ 2) + lambda/(2*m) * sum(theta(2:end) .^ 2);



theta_no_zero = theta(2:end);

grad0 = 1/m * X(:,1)' * (predictions - y);

gradj = 1/m * X(:,2:end)' * (predictions - y) + lambda/m * theta_no_zero;

grad = [grad0; gradj];











% =========================================================================

grad = grad(:);

end
