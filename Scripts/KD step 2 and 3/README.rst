
Follow the intructions below to obtain the **R squared results** for data analysis of the GaTech isolated testbed dataset from http://crawdad.org/gatech/fingerprinting/ .

1. Run function **CreateHist(filePath, traffic, Case, nBins, type, threshold)**

Set proper function parameters (see MATLAB help for function CreateHist).
Uses function LoadDataset() to load the GaTech IATs files into one cell array variable and creates histograms to approximate the distribution of IATs for each wireless device or device type. Exports the histograms in variable called *histMatrix* and the IAT traces in the cell array *dataMatrix* (the last one will be further used in the KD step 4).

2. Run **RSquared.m** script 
Inside the script the path to the histograms matrix obtained in 1, has to be provided.
Calculates R squared between the IAT histograms.

**Examples**

1. Calculate the R squared between *individual devices* for TCP case using raw data (without data cleaning) as in the Tutorial paper:
``CreateHist('~/isolatedTestbedData/', 'TCP', 0, 50000, 0, 0)``, then 
``RSquared``

2. Calculate the R squared between *individual devices* for UDP Case 1 using raw data (without data cleaning):
``CreateHist('~/isolatedTestbedData/', 'UDP', 1, 50000, 0, 0)``, then 
``RSquared``

3. Calculate the R squared between *device types* for TCP case using raw data (without data cleaning) as in the Tutorial paper:
``CreateHist('~/isolatedTestbedData/', 'TCP', 0, 50000, 1, 0)``, then 
``RSquared``

4. Calculate the R squared between *individual devices* for TCP case including data cleaning (KD step 3) with threshold 0.1 as in the Tutorial paper:
``CreateHist('~/isolatedTestbedData/', 'TCP', 0, 500, 1, 0.1)``, then 
``RSquared``

For more help use MATLAB ``help *functionName*`` (add function to MATLAB search path) and see comments inside the code.


