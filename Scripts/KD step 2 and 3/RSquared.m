
%This script calculates R squared between IAT histograms of wireless devices or device types

clc;
clear all;

%## Provide path to the histogram cell array that was exported by CreateHist()
% If not changed it is the same path as provided as parameter to CreateHist()
dir='~/isolatedTestbedData/';

file=strcat(dir,'histMatrix.mat');
load(file,'Y');
multiR2=[];

for i=1:size(Y,1)
    y=Y(i,:)';
    for j=1:size(Y,1)
        Z=ones(length(Y),1);
        Z=[Z Y(j,:)'];
        [b,bint,r,rint,stats]=regress(y,Z);
        multiR2(i,j)=stats(1);
    end
end
%Export R2 table
dst=dir; %# Change path for exporting the histMatrix here
save(strcat(dst,'R2.csv'),'multiR2','-ascii');
