function CreateHist(filePath, traffic, Case, nBins, type, threshold)

% CreateHist Creates scale-adjusted histograms of IATs collected from the GaTech isolated testbed fingerprinted devices and
% exports them into a cell array variable (in filePath), where each row is a vector of
% IATs from a particular device or device type. 
%Set Case to 0 if the traffic does not have a specific number case (e.g.
%TCP)
% Set type to 0 for obtaining histograms of individual devices.
% Set type to 1 for obtaining histograms of devices types.
% Set cutoff to 0 if no preprocessing is used.
%
%       CreateHist('~/isolatedTestbedData/', 'UDP', 1, 50000, 0, 0) creates
%       scale-adjusted histograms with 50000 bins from filePath '~/isolatedTestbedData/' for the UDP Case 1
%       traffic without preprocessing the data.
%
%       CreateHist('~/isolatedTestbedData/', 'TCP', 0, 500, 1, 0.1) creates
%       scale-adjusted histograms with 500 bins based on preprocessed IAT data using cleaning with threshold=0.1
%       from filePath '~/isolatedTestbedData/' for the TCP traffic.

%Set the full path to the IAT measurements variables
if Case==0;
    dir=strcat(filePath, traffic, '/');
else
    dir=strcat(filePath, traffic, '/' ,'Case', int2str(Case), '/');
end


%Load the IAT datasets into a cell array
data=LoadDataset(dir, traffic); %#Each row corresponds to IATs from one device.

% Check if device or device types are considered

if type==1
    %Call function to concatenate IAT traces from the same device type
    data=ConcatType(data);
elseif type~=0
    error('Wrong type parameter value!')
end

if threshold>0
       %Call function to preprocess the data (data cleaning)
        data=DataCleaning(data, threshold);
elseif threshold<0
        error('Wrong preprocessing parameter value!')
end

%Export the IAT traces into one cell array variable, one row corresponds to
%one device or device type
dst=filePath; %# Change path for exporting the histMatrix here
save(strcat(dst,'dataMatrix'), 'data')

% Find the minimum and maximum IAT from all traces and use for
% scale-adjusting all histograms

minY = min([data{:}]);   
maxY = max([data{:}]); 

Y=[]; %# Y stores the distribution of IATs, each row corresponds to the IAT frequencies of one device 
X=[]; %# X stores the bin  centers of the IAT distributions, each row corresponds bins of one device 

%Create scale-adjusted HISTOGRAMS
for i=1:length(data)
    
    [Y(i,:),X(i,:)]=scaleHistograms(data{i},minY,maxY,nBins);
    
end
%Export histograms matrix
save(strcat(dst,'histMatrix'), 'Y','X');

end