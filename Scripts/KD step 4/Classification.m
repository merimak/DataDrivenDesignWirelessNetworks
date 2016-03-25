%Creating the dataset for wireless device classification
clc;
clear all;

%%%%%%%% Initialize parameters below   %%%%%%%%%%

%Provide the Window Size parameter
step=5000;  %# E.g. step=5000 as in the paper
nBins=500;  %# 500 as in the paper
%## Provide path to the IAT dataset cell array that was exported by CreateHist()
% If not changed it is the same path as provided as parameter to CreateHist()
dir='~/isolatedTestbedData/';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file=strcat(dir,'dataMatrix.mat');
load(file);

slicedData={[]};  %# Stores the new dataset with more training examples according to the Window Size defined in step
class=[];  %# This vector stores the label values for each new training examples in slicedData
index=1;
for i=1:length(data)
    temp=data{i};
    n=1;
    for j=1:step:length(data{i})
        if j>=(length(data{i})-step)
            continue;
        else
            slicedData{index,:}=[temp(:,j:step*n)];
        end
        %Class assignment for labels for each new training example
        class(index,:)=i;
        
        n=n+1;
        index=index+1;
    end
end
% Find the minimum and maximum IAT from all sliced traces and use for
% scale-adjusting all histograms

minY = min([slicedData{:}]);
maxY = max([slicedData{:}]);

%Create scale-adjusted HISTOGRAMS = training examples
for i=1:size(slicedData,1)

    [Y(i,:),X(i,:)]=scaleHistograms(slicedData{i},minY,maxY,nBins);
  
end


%Creating dataset for Weka: features + labels
Z=[Y class];
csvwrite((strcat(dir,'TrainingSet.csv')), Z);
sprintf('Done! \n')
