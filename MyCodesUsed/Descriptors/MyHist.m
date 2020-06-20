function histogramArray=MyHist(array, bins)

% Setting up histogram array and padding it with zeros
histogramArray = zeros(1,bins);

% Looping through the input array and adding 1 to the corrisponding
% histogram bin
for x=1:length(array)
    histogramArray(1,array(x) + 1) = histogramArray(1,array(x) + 1) + 1;
end

% Normalizing the histogram so that the area under it sums to 1
histogramArray = histogramArray ./sum(histogramArray);

return