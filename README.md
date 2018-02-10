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

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
