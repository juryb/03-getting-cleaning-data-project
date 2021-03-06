Getting and Cleaning Data Project
=====================================

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1 - Merges the training and the test sets to create one data set.

2 - Extracts only the measurements on the mean and standard deviation for each measurement.

3 - Uses descriptive activity names to name the activities in the data set

4 - Appropriately labels the data set with descriptive variable names.

5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data Set Information
=======================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



1# Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt
Assign column names and merge to create one data set.

# 1&3. Merge the training and the test sets to create one data set.

class labels with their activity name
activity_labels

List of all features
features


subject who performed the activity for each window sample. # Its range is from 1 to 30. 
subject_test
subject_train

Test set & Train set.
X_test 
X_train

Test labels & Train labels
y_test
y_train

update values with correct activity names # Uses descriptive activity names to name the activities in the data set
correct column name
Combine  test data
test_data
Combine training  data
train_data 
Combine training and test data to create a final data set
all_data 

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Subset finalData
all_data_sub

# 4. Appropriately label the data set with descriptive activity names.

# 5. From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.
data_copy
Order
write.table
tidy_data.txt




