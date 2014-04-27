#run_analysis.R Data Clearning

##1.Merges the training and the test sets to create one data set.

#libraries. Three packages need to be installed.
library(plyr)
library(reshape)
library(reshape2)

##Load information
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

features <- scan("./UCI HAR Dataset/features.txt", what = "character", sep = " ")
labels <- scan("./UCI HAR Dataset/activity_labels.txt", what = "character", sep=" ")

##Load colnames
ID <- seq(2,length(features), by= 2)
Features <- features[ID]
ID <- seq(2, length(labels), by= 2)
Labels <- labels[ID]

##Merge datasets by Rows
##3.Uses descriptive activity names to name the activities in the data set
DataSet <- rbind(X_test, X_train)
colnames(DataSet) <- Features
Subject <- rbind(subject_test,subject_train)
colnames(Subject) <- c("Subject")
##4.Appropriately labels the data set with descriptive activity names. 
Activity <- rbind(y_test, y_train)
colnames(Activity) <- c("Activity")
Activity$Activity <-factor(Activity$Activity, labels = Labels)

##Merge into ONE DATA SET
DataTotal <- cbind(Subject,Activity,DataSet)

##2.Extracts only the measurements on the mean and standard deviation for each measurement. 

findmeans <- grep("mean", names(DataTotal))  # select means
findMeans <- grep("Mean", names(DataTotal))  # select Means
means <- append(findmeans,findMeans, after = length(findmeans))
STDs <- grep("std", names(DataTotal))  # select std's
Vars <- append(means,STDs, after = length(means))
Vars <- append(c(1,2),Vars, after = length(c(1,2)))
Vars<-sort(Vars)
tidy_data <- DataTotal[,Vars]

##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
mtidy_data <- melt(tidy_data,id.var = c("Subject", "Activity"))  
Result <-cast(mtidy_data, ... ~ variable, mean) 

# write the tidy data to a file
write.csv(tidy_data, file= "tidy_data.txt", row.names=FALSE)
data <- read.csv("tidy_data.txt") 
View(data)