function dst=cvpr_compare2(F1, F2)

% This function should compare F1 to F2 - i.e. compute the distance
% between the two descriptors

% For now it just returns a random number

%Eucliden Distance
% x=F1-F2;
% x=x.^2;
% x=sum(x);
% dst=sqrt(x);

% Modified Mahalonobis distance using the first Eigen Values
% y=F1-F2;
% y=y.^2;
% y=y/val;
% y=sum(y);
% dst=sqrt(y);
% y = Eigen_PCA(ALLFEAT);


%City block distance
x=F1+F2;
x=sum(x);
dst=(x)
return;


