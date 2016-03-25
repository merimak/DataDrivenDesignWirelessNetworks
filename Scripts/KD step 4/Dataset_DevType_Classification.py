'''
Created on Jul 27, 2015

@author: mkulin
This file creates the training dataset for Weka by adding the header naming row and modifying the class labels from numeric to nominal values
'''
import csv
pathToCSVfile='/home/mkulin/Documents/UGhent/Progress/January/TUTORIAL_paper/DATASETS/isolatedTestbedData/'
inputFilename='TrainingSet.csv'
outputFilename='TrainingSet_final.csv'
inputcsvfile=pathToCSVfile+inputFilename
outputcsvfile=pathToCSVfile+outputFilename
dataset=csv.reader(open(inputcsvfile))
#Set the number of bins
bins=500   #E.g. 500 (for cleaned dataset) as in the paper
lines=[]
firstrow=[]
#Create the row for naming the features and labels
for i in range(bins+1):
    firstrow.append('B'+str(i+1))
lines.append(firstrow)

#Convert 4 numeric class labels for device type classification to nominal labels
for instance in dataset:
    if instance[bins]=='1':
        instance[bins]='dell'
    elif instance[bins]=='2':
        instance[bins]='ipad'
    elif instance[bins]=='3':
        instance[bins]='iphone'
    elif instance[bins]=='4':
        instance[bins]='nokia'
    lines.append(instance)
    #print lines   
    
                    
           
writer = csv.writer(open(outputcsvfile, 'w'))
writer.writerows(lines)