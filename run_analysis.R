#Loading libraries
library(dplyr)

#reading relevant data into R
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

#Steps 1,3,4: Merge Data, Descriptive activity to name activities, Label the dataset with descriptive variable names
X<-rbind(X_test,X_train)
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)
names(X)<-features[,2]
names(subject)<-"Subject"
names(activity_labels)<-c("Activity #", "Activity_Labels")
y_labeled<-merge(y,activity_labels,by.x="V1",by.y="Activity #")


#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
dat<-X[,grepl("mean",names(X))|grepl("std",names(X))]
dat1<-cbind(subject,y_labeled[2],dat)



#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dat2<-group_by(dat1,Subject,Activity_Labels) %>%
summarise_each(funs(mean))

write.table(dat2,"Tidy Data.txt",row.names=FALSE)

#To read the data
#Make sure Tidy Data.txt is in the working directory
#read.table("Tidy Data.txt",header=TRUE)