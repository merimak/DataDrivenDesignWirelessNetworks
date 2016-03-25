Use the following instructions to obtain the training set to evaluate classification learning algorithms in Weka:

1. Provide the path to the **dataMatrix.mat** variable file exported by **CreateHist()**
in the ``Classification.m`` MATLAB script to create the training set (features + labels).

2. Run ``Classification.m`` to create and export the Training set instances in a CSV file.
Then run:

- For *device classification* Python script ``Dataset_Dev_Classification.py`` to form the final Training set for Weka.

- For *device type classification* Python script ``Dataset_DevType_Classification.py`` to form the final Training set for Weka.


**Examples**

1. Example for creating dataset for *device classification* as in the paper.

- Export the *dataMatrix* for pre-processed (cleaned) TCP traces:
``CreateHist('~/isolatedTestbedData/', 'TCP', 0, 500, 0, 0.1)``, 
or use the one that was exported in KD step 3.

- Create the training instances for the training set: run ``Classification.m``

- Form the final training set for Weka: run ``Dataset_Dev_Classification.py``

- Feed the obtained training set into Weka, select the *learning algorithm* to be trained and *cross-validation* to evaluate its performance.


2. Example for creating dataset for *device type classification* as in the paper.

- Export the *dataMatrix* for pre-processed (cleaned) TCP traces:
``CreateHist('~/isolatedTestbedData/', 'TCP', 0, 500, 1, 0.1)`` 

- Create the training instances for the training set: run ``Classification.m``

- Form the final training set for Weka: run ``Dataset_DevType_Classification.py``

- Feed the obtained CSV training set (TrainingSet_final.csv) into the Weka Explorer, then select the *learning algorithm* to be trained and *cross-validation* to evaluate its performance.
