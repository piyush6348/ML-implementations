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
%
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
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

p=zeros(size(X,1),num_labels);
a1=[ones(m,1),X];
z2=a1*Theta1';
a2=sigmoid(z2);
a2=[ones(m,1),a2];
z3=a2*Theta2';
a3=sigmoid(z3);

% for i=1:3
%     for j=1:4
%          fprintf('%f',a3(i,j));
%     end
%      fprintf('\n');
% end

log1=log(a3);
log2=log(1-a3);
[M,ind]=max(a3,[],2);

for i=1:m
    p(i,y(i,1))=1;
   % fprintf('%d is row number and index is %d\n',i,ind(i,1));
end

for i=1:m
    for k=1:num_labels
        %J=J+p(i,k)*log1(i,k)+(1-p(i,k))*log2(i,k);
        J=J+p(i,k)*log(a3(i,k))+(1-p(i,k))*log(1-a3(i,k));
      % fprintf('%f\n',J);
    end
end
J=-1*(J/m);

gr=0;
Q1_rows=size(Theta1,1);
Q1_columns=size(Theta1,2);
for i=1:Q1_rows
    for j=2:Q1_columns
        gr=gr+Theta1(i,j)*Theta1(i,j);
    end
end

Q2_rows=size(Theta2,1);
Q2_columns=size(Theta2,2);
for i=1:Q2_rows
    for j=2:Q2_columns
        gr=gr+Theta2(i,j)*Theta2(i,j);
    end
end

gr=(lambda*gr)/(2*m);
J=J+gr;

expected=zeros(m,num_labels);

for i=1:m
    expected(i,ind(i,1))=1;
end

%delta3=expected-p;
delta3=a3-p;
%fprintf('delta3 size %d %d\n',size(delta3,1),size(delta3,2));
delta2=(delta3*Theta2).*a2.*(1-a2);
%fprintf('delta2 size %d %d\n',size(delta2,1),size(delta2,2));
delta2=delta2(:,2:end);
%fprintf('delta2 size %d %d',size(delta2,1),size(delta2,2));
%delta1=(delta2*Theta1).*a1.*(1-a1);
%delta1=delta1(2:end);
Theta1_grad=delta2'*a1;
Theta2_grad=delta3'*a2;

 Theta1(:,1)=0;
 Theta2(:,1)=0;
 Theta1_grad=Theta1_grad+lambda*Theta1;
 Theta2_grad=Theta2_grad+lambda*Theta2;

Theta1_grad=Theta1_grad/m;
Theta2_grad=Theta2_grad/m;




% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
