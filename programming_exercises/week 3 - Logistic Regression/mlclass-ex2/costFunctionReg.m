function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


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

end
