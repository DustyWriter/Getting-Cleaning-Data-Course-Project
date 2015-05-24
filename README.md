# Getting-Cleaning-Data-Course-Project

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into your working directory  

Using the run_analysis.R file  
1) Loading libraries and reading data
-The package "dplyr" is loaded using the library(dplyr) command (you can install this package with the install.packages("dplyr") command  
-All the relevant training and test data were read into R  
-All the relevant activity labels, features and subjects were read into R  

2) Steps 1,3,4: Merge Data, Descriptive activity to name activities, Label the dataset with descriptive variable names
-The training data and test date for X,y and subject were merged together using a rbind command
-The variable names of the merged data set for X (measurements) were renamed as in the features.txt file

3) Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
-


