function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

% Adapt y to be represented with K elements.
adapted_y = zeros(size(y, 1), num_labels);
for i = 1:size(y, 1)
    adapted_y(i, y(i, 1)) = 1;
end

a1 = [ones(m, 1) X];
z2 = [ones(m, 1) X] * Theta1';
a2 = sigmoid(z2);
z3 = [ones(m, 1) a2] * Theta2';
a3 = sigmoid(z3);

J = 0;
for i = 1:m, 
    for k = 1:num_labels,
        J = J + ...
            (-adapted_y(i, k)*log(a3(i, k)) - (1 - adapted_y(i, k)) * log(1 - a3(i, k)));
    end
end

J = J * 1/m;


% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

Delta2 = 0;
Delta1 = 0;
for instance = 1:m
    x = X(instance, :);

    % FP
    a1 = [1; X(instance,:)'];
    z2 = Theta1 * a1;
    a2 = [1; sigmoid(z2)];
    z3 = Theta2 * a2;
    a3 = sigmoid(z3);


    d3 = a3 - adapted_y(instance, :)';

    d2 = (Theta2(:,2:end)'* d3) .* sigmoidGradient(z2);

    Delta1 = Delta1 + (d2 * a1');
    Delta2 = Delta2 + (d3 * a2');
end
Theta1_grad = (1/m) * Delta1;
Theta2_grad = (1/m) * Delta2;


% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Cost function regularization.
% Note that we start k at 2 because we must ignore the bias
% units weights.
regularization = 0;
for j = 1:size(Theta1, 1)
    for k = 2:size(Theta1, 2)
        regularization = regularization ...
            + Theta1(j, k)^2;
    end
end

for j = 1:size(Theta2, 1)
    for k = 2:size(Theta2, 2)
        regularization = regularization ...
            + Theta2(j, k)^2;
    end
end

regularization = regularization * lambda / (2*m);
J = J + regularization;

% NN Gradient Regularization
% Note that the first column of thetha should not be regularized as it's used
% for the bias term.
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + ((lambda / m) * Theta1(:,2:end));
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + ((lambda / m) * Theta2(:,2:end));
















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
