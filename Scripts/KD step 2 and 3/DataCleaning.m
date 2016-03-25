
function newdata=DataCleaning(data, c)

%DataCleaning preprocesses the fingerprinting datasets using data
%cleaning (removing outliers).
%   newD=DataCleaning(D, c) removes outliers in dataset (cell array) D starting from
%   threshold c and returns the new cleaned dataset newD.

newdata={[]}; 

for i=1:length(data)
   temp=data{i};
   temp(temp>c)=0;
   newdata{i,:}=temp(find(temp~=0));
 end

end