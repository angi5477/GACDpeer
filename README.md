run_analysis.R
========

Peer Assessments for Getting and Cleaning Data Project

Three packages are required to be installed before the test the scripts.
plyr
reshape
reshape2

Data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Unzip the Data and put the fold "UCI HAR Dataset"der the work Directory.

Notes and workflow for this script is written in run_analysis.R . 
Four main steps in this project.
1. Load data and assign colnames.
2. Merge data and assign descriptive activity names.
3. Filter measurements data only on the mean and standard deviation. And create tidy_data.
4. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
5. Output required datasets(tidy_data).

