### Installing libraries and packages needed
  # library(dplyr)
  # install.packages("reshape")
  # library(reshape)
 

# ### read features names
   features <- read.table("./data_review/UCI HAR Dataset/features.txt",header = FALSE,sep="");
   column_labels <- features[,2]

 ### Extracts only the measurements on the mean and standard
 ### deviation for each measurement.
   # getting column labels for mean
   mean_labels <- grep("(mean...[X-zX-Z]$)|(mean..$)",column_labels,value = FALSE)
   # getting column labels for std
   std_labels <- grep("(std...[X-zX-Z]$)|(std..$)",column_labels,value = FALSE)
   # combine the column headers to be extracted
   sub_dataset_index <- as.vector(c(std_labels,mean_labels))

 ### read training set files
   x_train <- read.table("./data_review/UCI HAR Dataset/train/X_train.txt",header = FALSE,sep="",col.names=column_labels)
   x_train <- x_train[,sub_dataset_index]
   y_train <- read.table("./data_review/UCI HAR Dataset/train/y_train.txt",header = FALSE,sep="",col.names=c("Training_label"))
   subject_train <- read.table("./data_review/UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep="",col.names=c("Subject"))
   training_dataset<-cbind(x_train,y_train,subject_train)

 ### read test set files
   x_test <- read.table("./data_review/UCI HAR Dataset/test/X_test.txt",header = FALSE,sep="",col.names=column_labels)
   x_test <- x_test[,sub_dataset_index]
   y_test <- read.table("./data_review/UCI HAR Dataset/test/y_test.txt",header = FALSE,sep="",col.names=c("Training_label"))
   subject_test <- read.table("./data_review/UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep="",col.names=c("Subject"))
   test_dataset<-cbind(x_test,y_test,subject_test)

 ### combine training and test data set
   complete_dataset <-rbind(training_dataset,test_dataset)


## Use descriptive activity names to name the activities in the data set
  # read activity labels
  activity_labels<- read.table("./data_review/UCI HAR Dataset/activity_labels.txt",header = FALSE,sep="", col.names=c("Number","Label"))
  complete_dataset<-mutate(complete_dataset,Training_label= activity_labels[complete_dataset$Training_label,2])

## Appropriately labels the data set with descriptive variable names. 
  # replacing label with a more descritive label
  dataSetNames<-names(complete_dataset)
  dataSetNames<-sub("\\.","",dataSetNames)
  dataSetNames<-sub("\\.\\.\\.","_",dataSetNames)
  dataSetNames<-gsub("\\.","",dataSetNames)
  dataSetNames<-sub("^tBody","3D Signal Body",dataSetNames)
  dataSetNames<-sub("^tGravity","3D Signal Gravity",dataSetNames)
  dataSetNames<-sub("^f[Bb]ody[Bb]ody","FD Signal Body",dataSetNames)
  dataSetNames<-sub("^fBody","FD Signal Body",dataSetNames)
  dataSetNames<-sub("Acc"," Accelerator ",dataSetNames)
  dataSetNames<-sub("Mag"," Magnitude ",dataSetNames)
  dataSetNames<-sub("Jerk"," Jerk ",dataSetNames)
  dataSetNames<-sub("Gyro"," Gyro ",dataSetNames)
  dataSetNames<-sub("std","StandardDev",dataSetNames)
  dataSetNames<-sub("mean","Mean",dataSetNames)
  dataSetNames<-sub("  "," ",dataSetNames)
  colnames(complete_dataset) <- c(dataSetNames)
  
## Creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
  # melting the original table
  melt_data_set<-melt(complete_dataset, id=c("Subject","Training_label"))
  # compute mean for each subject, training activity and variable
  cast_data<-cast(melt_data_set,Subject~Training_label~variable,mean,na.rm=TRUE)
  # # write the result to a file
  # # write the result to a file
  write.table(cast_data, file = "./tidy_data_set.txt", sep = "  ",row.names = FALSE)

  

  
