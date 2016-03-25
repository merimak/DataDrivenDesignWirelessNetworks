
function newdata=ConcatType(data)

% ConcatType Concatenates datasets from the same device type
%       ConcatType(A) concatenates rows within cell array variable A from the same device type. 
%       E.g. for TCP, UDP and SCP rows 1-5 are IATs from Dells


%Initialize vectors for IATs from the same device type
dn=[];     %# Dell devices
ipad=[];   %# iPad devices
iphone=[]; %# iPhone devices
nokia=[];  %# Nokia devices

newdata={[]}; 
numDevices=size(data,1); %Total number of devices

for j=1:numDevices
        
    if numDevices==14  %# Look at all traffic types that have traces from 14 devices 
        if j<6   %# First 5 devices (rows in datMatrix) are of type Dell    
            dn=[dn data{j}];
        elseif j>5 && j<9       %# Next 3 devices are of type iPad
            ipad=[ipad data{j}];
        elseif j>8 && j<13  
            iphone=[iphone data{j}];  %# Next 4 devices are of type iPhone
        else
            nokia=[nokia data{j}];    %# Last 2 devices are of type Nokia
        end
    elseif numDevices==12 
            %Look at ICMP traces which have 12 device traces (3 Dell
            %devices compared to 5 for other traffic cases)
        if j<4       
            dn=[dn data{j}];   %# First 3 devices (rows in datMatrix) are of type Dell
        elseif j>3 && j<7       
            ipad=[ipad data{j}];
        elseif j>6 && j<11  
            iphone=[iphone data{j}];
        else
            nokia=[nokia data{j}];

        end
     end       
end 
                     
newdata={dn; ipad; iphone; nokia};
    
end
