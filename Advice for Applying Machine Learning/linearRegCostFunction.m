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

J=J+ sum(sum((X*theta-y).^2));
J=J/(2*m);
o=theta(1);
theta(1)=0;
k=sum(sum(theta.^2));
k=(k*lambda)/(2*m);
J=J+k;

% % d1=sum(sum((X*theta-y).*X(:,1)))/m;
% 
% %fprintf('%d %d\n',size(X,1),size(X,2));
% theta(1)=0;
%  grad=((X'*(X*theta-y))+(lambda*theta))/m ;
 
%  theta_reg = [0;theta(2:end, :);];
%  grad = (1/m)*(X'*(X*theta-y)+lambda*theta_reg);

% X=X(:,2:end);
%  grad=(1/m)*(sum((X*theta-y).*X))'+((lambda*theta)/m);
%  grad(1)=grad(1)-(lambda*theta(1))/m;
theta(1)=o;
grad=(1/m)*(X'*(X*theta-y));
h=grad(1);
grad=grad+(lambda*theta)/m ;
grad(1)=h;
% =========================================================================

grad = grad(:);

end
