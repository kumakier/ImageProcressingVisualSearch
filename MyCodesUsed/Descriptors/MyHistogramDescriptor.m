function H=MyHistogramDescriptor(img)

% Q = 4;


% Normalizing the input image and then multipying it by Q and dropping the
% decimal point
qimg=double(img)./256;
qimg=floor(qimg.*Q);

% Creating bins where each 'pixel' contains an integer that represesnts the
% RGB value in the range 0 to (Q^3)-1
bin = qimg(:,:,1)*Q^2 + qimg(:,:,2)*Q^1 + qimg(:,:,3);

% Reshaping the 2D matrix into a long vector
vals=reshape(bin,1,size(bin,1)*size(bin,2));

% Using the custom Histogram function to create histogram of Q^3 bins
% H = MyHist(vals, Q^3);
H = hist(vals,Q^3);
% H = histogram(vals,Q^3);

return;