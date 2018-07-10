# run_analysis.R

# Using data collected from the accelerometers and gyroscopes on Samsung
# Galaxy S Smartphones for 30 individuals performing 6 activities, this
# R script:
#   - reads data from multiple text files
#   - merges the training and test group data sets into one data set;
#   - extracts only the measurements on the mean and standard deviation
#     for each measurement;
#   - uses descriptive activity names to name the activities in the data set;
#   - appropriately labels the data set with descriptive variable names; and 
#   - creates a second, independent tidy data set (i.e. each variable forms a
#     column, each observation forms a row, each type of observational unit forms
#     a table) with the average of each variable for each activity and each subject.

# data files downloaded from:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#See README.md for more details.

library(dplyr)

########################################################################

# read data

# read training group data
trainingMeasurements <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingActivities <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test group data
testMeasurements <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# read features as characters
variableNames <- read.table("./UCI HAR Dataset/features.txt", as.is = TRUE)

########################################################################

# merge training and test group data into one data set

mergeMeasurements <- rbind(trainingMeasurements,testMeasurements)
colnames(mergeMeasurements) <- variableNames[,2]
mergeActivities <- rbind(trainingActivities, testActivities)
colnames(mergeActivities) = "Activity"
mergeSubjects <- rbind(trainingSubjects, testSubjects)
colnames(mergeSubjects) = "Subject"
mergedData <- cbind(mergeSubjects,mergeActivities,mergeMeasurements)

########################################################################

# extract only the measurements on the mean and standard deviation

desiredColumns <- grep("Subject|Activity|mean|std",colnames(mergedData))
desiredData <- mergedData[,desiredColumns]

########################################################################
 
# use descriptive activity names to name the activities in the data set

desiredData$Activity <- factor(desiredData$Activity,levels = activityLabels[,1], labels = activityLabels[,2])

########################################################################

# appropriately label the data set with descriptive variable names

newVariableNames <- names(desiredData)
newVariableNames <- gsub("tBody", "timeBody", newVariableNames)
newVariableNames <- gsub("tGravity", "timeGravity", newVariableNames)
newVariableNames <- gsub("fBody", "frequencyBody", newVariableNames)
newVariableNames <- gsub("Acc", "Accelerometer", newVariableNames)
newVariableNames <- gsub("Gyro", "Gyroscope", newVariableNames)
newVariableNames <- gsub("Mag", "Magnitude", newVariableNames)
newVariableNames <- gsub("Freq", "Frequency", newVariableNames)
newVariableNames <- gsub("BodyBody", "Body", newVariableNames)
newVariableNames <- gsub("mean", "Mean", newVariableNames)
newVariableNames <- gsub("std", "StandardDeviation", newVariableNames)
newVariableNames <- gsub("-","", newVariableNames)
colnames(desiredData) <- newVariableNames

######################################################################## 

# create an independent tidy data set with the average of each variable
# for each activity and each subject

tidyData <- desiredData %>% group_by(Subject,Activity) %>% summarize_at(vars(-Subject,-Activity),funs(mean(., na.rm = TRUE)))
write.table(tidyData, file = "./UCI HAR Dataset/tidyData.txt", quote = FALSE, row.names = FALSE)
