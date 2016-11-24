function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

for k=1:length(X)
    if y(k)==1
        plot(X(k,1),X(k,2),'k+','LineWidth',2,'MarkerSize',7);
        hold on;
    else
        plot (X(k,1),X(k,2),'ko','MarkerFaceColor','y','MarkerSize',7);
        hold on;
    end
end
hold off;






% =========================================================================



hold off;

end
