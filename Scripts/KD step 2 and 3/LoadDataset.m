
function data=LoadDataset(filePath, traffic)
% LoadDataset Loads all fingerprinting datasets for a particular traffic
% case anad stores them into a cell array variable.
%
%       A=LoadDataset('~/isolatedTestbedData/TCP/', 'TCP') loads the isolated testbed dataset
%       from TCP case form the filePath '~/isolatedTestbedData/TCP/' and stores in cell array A.
%
%       A=LoadDataset('~/isolatedTestbedData/UDP/Case1/', 'UDP') loads the UDP Case1 isolated testbed dataset
%       from the filePath '~/isolatedTestbedData/UDP/Case1/' and stores in cell array A.
    

%Variable numDev depends on the number of different devices from which data has been collected
if strcmp(traffic, 'ICMP')
    numDev=12;
else
    numDev=14; %# TCP, UDP and SCP have traces from 14 devices
end
    
%Load the content of files in filePath into one matrix 
data=cell(numDev,1);
  
  dirData = dir(filePath);      %# Get the data for the current directory
  dirIndex = [dirData.isdir];  %# Find the index for directories
  fileList = {dirData(~dirIndex).name}';  %# Get a list of the files
  if ~isempty(fileList)
    fileList = cellfun(@(x) fullfile(filePath,x),...  %# Prepend path to files
                       fileList,'UniformOutput',false);
  end

  for i = 1:length(fileList)
      val=load(fileList{i},'iat');
      data{i}=val.iat;      %# Load the iat variables
  end
  
end