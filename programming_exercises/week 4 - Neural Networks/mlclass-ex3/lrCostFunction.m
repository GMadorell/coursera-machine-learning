function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training example

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%


% Same exact code from last week, as I already implemented it in 
% a vectorized form :P.

h = apply_hypothesis(theta, X);
theta_no_zero = theta(2:end);

J = 1/m * sum(-y .* log(h) - (1 - y) .* log(1 - h)) ...
    + lambda/(2*m) * sum(theta_no_zero .^ 2);


% We don't shrink the theta0 value, so we calculate the 0 value in a
% different way,
grad0 = 1/m * X(:,1)' * (h - y);

gradj = 1/m * X(:,2:end)' * (h - y) + lambda/m * theta_no_zero;

grad = [grad0; gradj];



    function hyp_value = apply_hypothesis(theta, X)
        hyp_value = sigmoid(X * theta);
    end



% =============================================================

grad = grad(:);

end
