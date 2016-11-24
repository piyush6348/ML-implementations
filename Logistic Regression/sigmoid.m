function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));
k = size(z);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
%if isequal(k,[1 1])
 %   g=(1+exp(-z))^(-1);
%end
%if k(1,1)~=1 || k(1,2)~=1
    for i=1:k(1,1)
        for j=1:k(1,2)
            g(i,j)=(1+exp(-z(i,j)))^(-1);
        end
    end
%end

    



% =============================================================

end
