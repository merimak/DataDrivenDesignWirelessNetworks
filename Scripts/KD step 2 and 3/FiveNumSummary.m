
%This code calculates the statistical moments for the TCP dataset

%First run CreateHist(dir, traffic, Case, nBins, type, threshold) to
%obtain the dataMatrix. For this set:
%- 'dir' to as the path to the isolated testbed dataset
%- 'traffic' to the traffic type of traces, e.g. 'TCP'
%- 'Case' to the traffic case, e.g. 1 if traffic=UDP, 0 if traffic=TCP
%- nBins=0, type=0, threshold=0

clear all;
clc;

%## Provide path to the IAT dataset cell array that was exported by CreateHist()
dir='~/isolatedTestbedData/';

file=strcat(dir,'dataMatrix.mat');
load(file);

minimum=[];
Q1=[];
medianval=[];
Q3=[];
maximum=[];

%Calculate the five number summary 
for i=1:size(data,1)
    d=[data{i}];
    minimum(i,1)=min(data{i});
    Q1(i,1)=median(d(find(d<median(d))));
    medianval(i,1)=median(data{i});
    Q3(i,1)=median(d(find(d>median(d))));
    maximum(i,1)=max(data{i});
end