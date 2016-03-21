# 1. Merge the training and the test sets to create one data set.

#class labels with their activity name
activity_labels<- read.table("~/UCI HAR Dataset/activity_labels.txt", sep=" " ,na.strings = TRUE)

#List of all features
features<- read.table("~/UCI HAR Dataset/features.txt", sep=" " ,na.strings = TRUE)

#Each row identifies the subject who performed the activity for each window sample. 
#Its range is from 1 to 30. 
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", na.strings = TRUE)

#Test set.
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", na.strings = TRUE)

#Test labels
y_test<- read.table("~/UCI HAR Dataset/test/y_test.txt", na.strings = TRUE)

#Uses descriptive activity names to name the activities in the data set (step3)
# update values with correct activity names
y_test[, 1] <- activity_labels[y_test[, 1], 2]
# correct column name
names(X_test)<-features[,2]
names(subject_test)<-"subject"
names(y_test) <- "activity"


# Combine  test data
test_data <-data.frame(subject_test,y_test,X_test)

######

#Each row identifies the subject who performed the activity for each window sample. 
#Its range is from 1 to 30. 
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", na.strings = TRUE)

#train set.
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", na.strings = TRUE)

#train labels
y_train<- read.table("~/UCI HAR Dataset/train/y_train.txt", na.strings = TRUE)

#Uses descriptive activity names to name the activities in the data set (step3)
# update values with correct activity names
y_train[, 1] <- activity_labels[y_train[, 1], 2]
# correct column name
names(X_train)<-features[,2]
names(subject_train)<-"subject"
names(y_train) <- "activity"


# Combine training  data
train_data <-data.frame(subject_train,y_train,X_train)

# Combine training and test data to create a final data set
all_data <-rbind(test_data,train_data)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

labels <- names(all_data)
txt <- "((.*)[Mm]ean(.*))|((.*)[Ss]td(.*))"

#Subset finalData
all_data_sub <- all_data[,c(1,2,grep(pattern = txt , x = labels))]


# 3. Use descriptive activity names to name the activities in the data set
# see step 1 

# 4. Appropriately label the data set with descriptive activity names.
names(all_data_sub)<-gsub("^t", "Time", names(all_data_sub))
names(all_data_sub)<-gsub("^f", "Frequency", names(all_data_sub))
names(all_data_sub)<-gsub("Acc", "Accelerometer", names(all_data_sub))
names(all_data_sub)<-gsub("Gyro", "Gyroscope", names(all_data_sub))
names(all_data_sub)<-gsub("Mag", "Magnitude", names(all_data_sub))
names(all_data_sub)<-gsub("BodyBody", "Body", names(all_data_sub))
names(all_data_sub)<-gsub("mean", "Mean", names(all_data_sub))
names(all_data_sub)<-gsub("std", "StdDev", names(all_data_sub))
names(all_data_sub)<-gsub("\\.", "", names(all_data_sub))

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

library(plyr);

data_copy <-aggregate(. ~subject + activity, all_data_sub, mean)
data_copy <-data_copy[order(data_copy$subject,data_copy$activity),]
write.table(data_copy, file = "tidy_data.txt",row.name=FALSE)


library(knitr)
knit2html("codebook.Rmd");
