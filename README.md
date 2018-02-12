# coursera-module3-assignment
This repository is for module 3 assignments in coursera under data science track.

To run the program properly make sure you have a directory "data_review"
in your working directory. The folder UCI HAR Dataset, that contains all the extracted data,
should be inside data_review directory.

Data set can be downloaded in the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Also, make sure you have pre-installed packages and libraries as listed below.
  1. install.packages("dplyr")
  2. library(dplyr)
  3. install.packages("reshape")
  4. library(reshape)
  
Otherwise, comment the first few line od the code (for installation) to install the 
needed packages and libraries.

The ouput of the program will be located in your working directory with a file name
tidy_data_set.csv.

Below is the main flow of the program:

Step 1. Merges the training and the test sets to create one data set.
  * gets the features labels from features.txt file. These labels will serve as the header name for each activity
  * gets all the labels associated to MEAN and STANDARD DEVIATION. 
  * the extracted mean and std labels are then used to extract needed activities and their measurement
  * the code extracted the train data set first then followed by the test data set
  * the train and test data set are then combined to get complete_dataset
  
Step 2. Uses descriptive activity names to name the activities in the data set
  * gets the activity labels from activity_labels.txt. This will replace activity number label by character label
  * the code used mutate function to rename activity label
  
Step 3. Labels the data set with descriptive variable names.
  * I edit the variable names using sub function
  * the code did the following changes: 
    *"tBody" was replaced by "3D Signal Body"
    *"tGravity" was replaced by "3D Signal Gravity"
    *"fbodybody" was replaced by "FD Signal Body"
    *"fBody" was replaced by "FD Signal Body"
    *"Acc" was replaced by " Accelerator "
    *"Mag" was replaced by " Magnitude "
    *"Jerk" was replaced by " Jerk "
    *"Gyro" was replaced by " Gyro "
    *"std" was replaced by "StandardDev"
    *"mean" was replaced by "Mean"
      
Step 4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * the code used MELT function to create a new data frame to be used for computation of mean
  * the resulting data frame were then casted to compute the mean for each variable for each activity and each subject
  * the resulting data was then written in a text file using write.table()




