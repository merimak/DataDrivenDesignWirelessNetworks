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
bins=500   #E.g. 500 (for cleaned dataset) or 50000 (for raw dataset), as in the paper
lines=[]
firstrow=[]
#Create the row for naming the features and labels
for i in range(bins+1):
    firstrow.append('B'+str(i+1))
lines.append(firstrow)

#Convert the numeric class labels for device classification to nominal labels
##Note: If evaluating ICMP use only 3 dell devices!
for instance in dataset:
    if instance[bins]=='1':
        instance[bins]='dell1'
    elif instance[bins]=='2':
        instance[bins]='dell2'
    elif instance[bins]=='3':
        instance[bins]='dell3'
    elif instance[bins]=='4':
        instance[bins]='dell4'
    elif instance[bins]=='5':
        instance[bins]='dell5'       
    elif instance[bins]=='6':
        instance[bins]='ipad1'
    elif instance[bins]=='7':
        instance[bins]='ipad2'
    elif instance[bins]=='8':
        instance[bins]='ipad3'
    elif instance[bins]=='9':
        instance[bins]='iphone1'
    elif instance[bins]=='10':
        instance[bins]='iphone2'
    elif instance[bins]=='11':
        instance[bins]='iphone3'
    elif instance[bins]=='12':
        instance[bins]='iphone4'        
    elif instance[bins]=='13':
        instance[bins]='nokia1'
    elif instance[bins]=='14':
        instance[bins]='nokia2'
    lines.append(instance)
    #print lines   
    
                    
           
writer = csv.writer(open(outputcsvfile, 'w'))
writer.writerows(lines)