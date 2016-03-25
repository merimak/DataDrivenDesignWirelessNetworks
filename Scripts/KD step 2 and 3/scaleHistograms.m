%scaleHistograms finds and returns frequency counts and bin centers of
%scale-adjusted histograms.
%
%       [C, B] = scaleHistograms(Y, minY, maxY, N) returns counts C and
%       bin centers B for histograms binned with N bins of IATs contained in rows of cell array Y, and
%       adjusts them according to values minY and maxY.


function [counts,bins] = scaleHistograms(y, minY, maxY, nBins)

    yA2 = [y minY maxY];
    [counts1, bins] = hist(yA2, nBins);
    [counts0, bins0] = hist(y, nBins);
    %# Remove extrema placeholders from counts
    histEnds = zeros(size(bins));
    histEnds(1) = 1; %# Removes minimum placeholder
    histEnds(end) = 1; %# Removes maximum placeholder
    counts = counts1-histEnds;

end
