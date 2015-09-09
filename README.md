# Getting-Cleaning-Data-Course-Project

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into your working directory  

Using the run_analysis.R file  
1) Loading libraries and reading data
-The package "dplyr" is loaded using the library(dplyr) command (you can install this package with the install.packages("dplyr") command  
-All the relevant training and test data were read into R  
-All the relevant activity labels, features and subjects were read into R  

2) Merge Data, Descriptive activity to name activities, Label the dataset with descriptive variable names
-The training data and test date for X,y and subject were merged together using a rbind command
-The variable names of the merged data set for X (measurements) were renamed as in the features.txt file
-The variable name of the merged data set for subject is renamed to Subject
-The numbers representing an activity in the merged y dataset were changed to the activity labels instead and the variable name is Activity_Labels

3) Extracts only the measurements on the mean and standard deviation for each measurement  
-dat extracts from the X data set whereby the name of the variable in X contains mean or std  
-dat1 combines subject,subject_activity*,dat)  
*subject_activity is y_labeled[2] in my code

4) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
-The dat1 data set is then grouped by Subject and Activity_Labels (this is the activity the subject is performing) using a dplyr command which is the group_by command  
-The average of each variable for each activity and each subject is then calculated using the dplyr summarise_each function and stored in the dat2 object  
-Finally the dat2 data is written into a txt file called Tidy Data.txt


5) To read the data.  
-Do note the data is not meant to be viewed in the notepad text editor.  
-To read the data, make sure Tidy Data.txt is in your working directory.
-run the command read.table("Tidy Data.txt,header=TRUE)  
-the code is already in the run_analysis.R file, just uncomment it to run


