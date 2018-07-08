# Code Book for Coursera Getting and Cleaning Data Course Project 

## Introduction

This Code Book describes the data used in this project, the variables used as well as data processing performed to create a tidy data set.

A tidy data set can be described as a data set where:
  - each variable forms a column;
  - each observation forms a row; and
  - each type of observational unit forms a table

## Source Data

The specific data for this project was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The above data was based on sensor signals (accelerometers and gyroscopes) from the Samsung Galaxy S smartphones worn on the waists of 30 volunteers performing 6 different activities (walking, walking upstairs, walking downstairs, sitting, standing and laying).

Data contained in the Inertial Signals folders (raw signal data) were not used in this project.

The raw time domain signals were filtered to remove noise. The acceleration signal was then separated into body and gravity acceleration signals and filtered. Subsequently, body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. A Fast Fourier Transform (FFT) was applied to some of these signals (frequency domain signals).

The above signals were used to estimate 561 variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The obtained dataset was then randomly partitioned into two sets, where 21 of the volunteers was selected for generating the training data and 9 were selected for the test data. The following provides details on the partitioned data sets:

## Training Data

X_train.txt - contains 7,352 observations of 561 features with respect to 21 volunteers in the training group
y_train.txt - contains the ID indicator of the volunteer associated with each of the above 7,352 observations
subject_train.txt - contains the activity indicators associated with each of the above 7,352 observations

## Test Data

X_test.text - contains 2,947 observations of 561 features with respect to 9 volunteers in the test group
y_train.txt - contains the ID indicator of the volunteer associated with each of the above 2,947 observations
subject_test.txt - contains the activity indicators associated with each of the above 2,947 observations

## Activity Variable

activity_labels.txt contains the activity indicators and can be summarized as follows:
    1 - WALKING 
    2 - WALKING_UPSTAIRS
    3 - WALKING_DOWNSTAIRS
    4 - SITTING
    5 - STANDING
    6 - LAYING

## Features Variable

features.txt - contains the variable names pertaining to the 561 elements of each feature vector

Features are normalized and bounded within [-1,1]

features_info.txt - contains addtional information about the features 

## Additional Information

For more information about the source data please refer to the README.txt.

## Data Processing

The run_analysis.R script:   
 - reads the above text files
 - merges the training and test data creating a single data.frame containing 10,299 observations of 561 features
 - merges the 2 activity indicator files creating a single data.frame (dimension 10,299 x 1) 
 - merges the 2 ID indicator files creating a single data.frame (dimension 10,299 x 1)
 - adds appropriate column names to to each data.frame
 - merges the 3 merged data.frames into a new single data.frame (dimension 10,299 x 563)
 - constructs a smaller data.frame by extracting from the merged data.frame only those columns that referenced mean or standard deviation as required for this a project (dimension 10,299 x 81)
 - converts the activity indicators to factors with appropriate labels (WALKING, STANDING, etc.)
 - modifies the abbreviated column names to be more descriptive and removes any dashes (modified variable names are summarized in the next section) 
 - creates a second, independent tidy data set with the average of each variable for each activity and each subject (dimension 180 x 81)
 - writes the tidy data set to a text file (tidyData.txt)

## Variables of Tidy Data Set

The variables of the tidy data set are as follows:

###Subject and Activity Variables

1	  Subject : Volunteer ID indicator (integer)                                                      					
2	  Activity: Activity performed by volunteer (factor with 6 levels "WALKING"", "STANDING", etc. as described above)                                                  		

###Feature Variables

Feature variables are numeric and expressed as the average of the variable for each volunteer for each activity.

Mean Time Domain Body Acceleration in X, Y and Z directions:
3	  timeBodyAccelerometerMean()X                              					
4	  timeBodyAccelerometerMean()Y                              					
5	  timeBodyAccelerometerMean()Z

Standard Deviation of the Time Domain Body Acceleration in the X, Y and Z directions:
6	  timeBodyAccelerometerStandardDeviation()X                 					
7	  timeBodyAccelerometerStandardDeviation()Y                 					
8	  timeBodyAccelerometerStandardDeviation()Z

Mean Time Domain Gravity Acceleration in the X, Y, and Z directions:
9	  timeGravityAccelerometerMean()X                           					
10	timeGravityAccelerometerMean()Y                           					
11	timeGravityAccelerometerMean()Z

Standard Deviation of the Time Domain Gravity Acceleration in the X, Y, and Z directions:
12	timeGravityAccelerometerStandardDeviation()X              					
13	timeGravityAccelerometerStandardDeviation()Y              					
14	timeGravityAccelerometerStandardDeviation()Z

Mean Time Domain Body Linear Acceleration Jerk Signal in the X, Y and Z directions:  
15	timeBodyAccelerometerJerkMean()X                          					
16	timeBodyAccelerometerJerkMean()Y                          					
17	timeBodyAccelerometerJerkMean()Z

Standard Deviation of the Time Domain Linear Acceleration Jerk Signal in the X, Y, and Z directions:
18	timeBodyAccelerometerJerkStandardDeviation()X             					
19	timeBodyAccelerometerJerkStandardDeviation()Y             					
20	timeBodyAccelerometerJerkStandardDeviation()Z

Mean Time Domain Body Angular Velocity in the X, Y and Z directions:
21	timeBodyGyroscopeMean()X                                  					
22	timeBodyGyroscopeMean()Y                                  					
23	timeBodyGyroscopeMean()Z

Standard Deviation of the Time Domain Body Angular Velocity in the X, Y, and Z directions:
24	timeBodyGyroscopeStandardDeviation()X                     					
25	timeBodyGyroscopeStandardDeviation()Y                     					
26	timeBodyGyroscopeStandardDeviation()Z

Mean Time Domain Body Angular Velocity Jerk Signal in the X, Y and Z directions:
27	timeBodyGyroscopeJerkMean()X                              					
28	timeBodyGyroscopeJerkMean()Y                              					
29	timeBodyGyroscopeJerkMean()Z

Standard Deviation of the Time Domain Body Angular Velocity Jerk Signal in the X, Y and Z directions:
30	timeBodyGyroscopeJerkStandardDeviation()X                 					
31	timeBodyGyroscopeJerkStandardDeviation()Y                 					
32	timeBodyGyroscopeJerkStandardDeviation()Z

Mean Time Domain Body Acceleration Magnitude: 
33	timeBodyAccelerometerMagnitudeMean()

Standard Deviation of the Time Domain Body Acceleration Magnitude:
34	timeBodyAccelerometerMagnitudeStandardDeviation()

Mean Time Domain Gravity Acceleration Magnitude: 
35	timeGravityAccelerometerMagnitudeMean()

Standard Deviation of the Time Domain Gravity Acceleration Magnitude:
36	timeGravityAccelerometerMagnitudeStandardDeviation()

Mean Time Domain Body Linear Acceleration Jerk Signal Magnitude:
37	timeBodyAccelerometerJerkMagnitudeMean()

Standard Deviation of the Time Domain Body Linear Acceleration Magnitude:
38	timeBodyAccelerometerJerkMagnitudeStandardDeviation()

Mean Time Domain Body Angular Velocity Magnitude:
39	timeBodyGyroscopeMagnitudeMean()

Standard Deviation of the Time Domain Body Angular Velocity Magnitude:
40	timeBodyGyroscopeMagnitudeStandardDeviation()

Mean Time Domain Body Angular Velocity Jerk Signal Magnitude:
41	timeBodyGyroscopeJerkMagnitudeMean()

Standard Deviation of the Time Domain Body Angular Velocity Jerk Signal Magnitude:
42	timeBodyGyroscopeJerkMagnitudeStandardDeviation()

Mean Frequency Domain Body Acceleration in X, Y and Z directions:
43	frequencyBodyAccelerometerMean()X                         					
44	frequencyBodyAccelerometerMean()Y                         					
45	frequencyBodyAccelerometerMean()Z

Standard Deviation of the Frequency Domain Body Acceleration in the X, Y and Z directions:
46	frequencyBodyAccelerometerStandardDeviation()X            					
47	frequencyBodyAccelerometerStandardDeviation()Y            					
48	frequencyBodyAccelerometerStandardDeviation()Z

Mean Frequency Domain Body Acceleration Mean Frequency in the X, Y and Z directions:
49	frequencyBodyAccelerometerMeanFrequency()X                					
50	frequencyBodyAccelerometerMeanFrequency()Y                					
51	frequencyBodyAccelerometerMeanFrequency()Z

Mean Frequency Domain Body Linear Acceleration Jerk Signal in the X, Y and Z directions:
52	frequencyBodyAccelerometerJerkMean()X                     					
53	frequencyBodyAccelerometerJerkMean()Y                     					
54	frequencyBodyAccelerometerJerkMean()Z

Standard Deviation of the Frequency Domain Body Linear Acceleration Jerk Signal in the X, Y and Z directions:
55	frequencyBodyAccelerometerJerkStandardDeviation()X        					
56	frequencyBodyAccelerometerJerkStandardDeviation()Y        					
57	frequencyBodyAccelerometerJerkStandardDeviation()Z

Mean Frequency Domain Body Linear Acceleration Jerk Signal Frequency in the X, Y and Z directions:
58	frequencyBodyAccelerometerJerkMeanFrequency()X            					
59	frequencyBodyAccelerometerJerkMeanFrequency()Y            					
60	frequencyBodyAccelerometerJerkMeanFrequency()Z

Mean Frequency Domain Body Angular Velocity in the X, Y and Z directions:
61	frequencyBodyGyroscopeMean()X                             					
62	frequencyBodyGyroscopeMean()Y                             					
63	frequencyBodyGyroscopeMean()Z

Standard Deviation of the Frequency Domain Body Angular Velocity in the X, Y and Z directions:
64	frequencyBodyGyroscopeStandardDeviation()X                					
65	frequencyBodyGyroscopeStandardDeviation()Y                					
66	frequencyBodyGyroscopeStandardDeviation()Z

Mean Frequency Domain Body Angular Velocity Frequency in the X, Y and Z directions:
67	frequencyBodyGyroscopeMeanFrequency()X                    					
68	frequencyBodyGyroscopeMeanFrequency()Y                    					
69	frequencyBodyGyroscopeMeanFrequency()Z

Mean Frequency Domain Body Acceleration Magnitude:
70	frequencyBodyAccelerometerMagnitudeMean()

Standard Deviation of the Frequency Domain Body Acceleration Magnitude:
71	frequencyBodyAccelerometerMagnitudeStandardDeviation()

Mean Frequency Domain Body Acceleration Magnitude Frequency:
72	frequencyBodyAccelerometerMagnitudeMeanFrequency()

Mean Frequency Domain Body Linear Acceleration Jerk Signal Magnitude:
73	frequencyBodyAccelerometerJerkMagnitudeMean()

Standard Deviation of the Frequency Domain Body Linear Acceleration Jerk Signal Magnitude:
74	frequencyBodyAccelerometerJerkMagnitudeStandardDeviation()

Mean Frequency Domain Body Linear Acceleration Jerk Signal Magnitude Frequency:
75	frequencyBodyAccelerometerJerkMagnitudeMeanFrequency()

Mean Frequency Domain Body Angular Velocity Magnitude:
76	frequencyBodyGyroscopeMagnitudeMean()

Standard Deviation of the Frequency Domain Body Angular Velocity Magnitude:
77	frequencyBodyGyroscopeMagnitudeStandardDeviation()

Mean Frequency Domain Body Angular Velocity Magnitude Frequency:
78	frequencyBodyGyroscopeMagnitudeMeanFrequency()

Mean Frequency Domain Body Angular Velocity Jerk Signal Magnitude:
79	frequencyBodyGyroscopeJerkMagnitudeMean()

Standard Deviation of the Frequency Domain Body Angular Velocity Jerk Signal Magnitude:
80	frequencyBodyGyroscopeJerkMagnitudeStandardDeviation()

Mean Frequency Domain Body Angular Velocity Jerk Signal Magnitude Frequency:
81	frequencyBodyGyroscopeJerkMagnitudeMeanFrequency() 					
                                             
