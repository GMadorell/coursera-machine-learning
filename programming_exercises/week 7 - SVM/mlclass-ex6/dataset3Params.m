function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

best_C = -1;
best_sigma = -1;
smallest_error = 99999999999999999;
for i = 1:size(C_values, 2)
    for j = 1:size(sigma_values, 2)
        C = C_values(1, i);
        sigma = sigma_values(1, j);
        
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
        
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        
        if error < smallest_error
            smallest_error = error;
            best_C = C;
            best_sigma = sigma;
        end
    end
end

C = best_C;
sigma = best_sigma;




% =========================================================================

end
