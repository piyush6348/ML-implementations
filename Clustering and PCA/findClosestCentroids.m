function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i=1:size(X,1)
    %z=(centroids(:,1)-X(i,1)).^2+ (centroids(:,2)-X(i,2)).^2;
    %z=sum((centroids-X(i,:).^2),2);
    z=sum(((bsxfun(@minus,centroids,X(i,:))).^2),2);
    [val idx(i,1)]=min(z);
   % fprintf('z = %f index = %f i=%d\n',z,idx(i,1),i);
end

% for i=1:size(idx,1)
%     fprintf('\n ind =%f',idx(i,1));
% end




% =============================================================

end

