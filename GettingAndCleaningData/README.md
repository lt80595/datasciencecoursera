Getting And Cleaning Data Course Project
========================================================

This Course Project has 3 files:
* README.md
* CodeBook.md
* run_analysis.R

### How Data Analysis was performed:

1. Downloaded files from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and manually unzipped them into my working directory.  The remaining files were: "README.txt", "features.txt", "features_info.txt", "activity_labels.txt", and 2 folders ("test" and "train") that contained either "subject_test.txt", "X_test.txt", and "y_test.txt" or "subject_train.txt", "X_train.txt", and "y_train.txt".
2. Read data sets into RStudio using read.table() function.
3. Assign column names to data sets if not already provided.  Note: "features.txt" column 2 are the column names for "X_test.txt" and "X_train.txt".
4. Create data sets for all Test data using cbind(). (subject values from "subject_test.txt", activity values from "Y_test.txt", measurement values from "X_test.txt", and partition variable "Test" attached to each observation)
5. 4. Create data sets for all Training data using cbind(). (subject values from "subject_train.txt", activity values from "Y_train.txt", measurement values from "X_train.txt", and partition variable "Train" attached to each observation)
6. Note: I choose to attach a partition variable "Test" or "Train" to each observation for future data analysis needs.  However this was not needed for the described course project.
7. Merge all Test and Training data together using rbind().  The resultant data frame is named "AllDF" and this completes item 1 of the Course Project description.
8. Extract only the columns numbers of AllDF regarding mean() and std() measurements using grep() and combine into "extr" variable.  By setting ignore.case = FALSE, columns with data regarding gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, and tBodyGyroJerkMean were automatically ignored.
9. Extract column numbers of AllDF regarding meanFreq() measurements using grep() and store into variable "igno".
10. Create a vector, "g", that has column numbers to extract from AllDF (the "extr" values), but not the column numbers to extract regarding meanFreq() (ie. the "igno" values).  The result is 66 column numbers for measurements to be taken out of the original 561 columns of measurements.
11. Create a new data set, "NewDF", that has only these columns from AllDF: 1 (subject), 2 (activity), 564 (partition), and g (column numbers described in prior step).  This completes item 2 of the Course Project description.
12. Use gsub() to change the activity values in the activity column of "NewDF" into English descriptions (WALKING, LAYING, etc.) rather than numbers.  The values and corresponding English descriptions were shown in the "activity_labels.txt" file.  This completes item 3 of the Course Project description.
13. Change the column names to be more descriptive and readable.  I choose to use Camel Case and remove inappropriate characters like - or ().  For example: "tBodyAcc-mean()-X" would become "TimeBodyAccelerationMeanX".  This was done using an internal function and for loop to capitalize the first letter (either "t" or "f").  Then use gsub() to change: "t" to "Time", "f" to "Frequency", "mean" to "Mean", "Acc" to "Acceleration", "Mag" to "Magnitude", "Gyro" to "Gyroscope", "BodyBody" to "Body" (an error from original data source), and delete values "(", ")", "-", and ",".  This completes item 4 in the Course Project description.
14. Transform the Subject and Activity parameters into factors using the transform() function.
15. Use melt() function on "NewDF" data set, with the id variables "Subject" and "Activity" and the measurement value variables all of the other columns, excluding "Partition" column 3.
16. Use dcast() function to find the mean values of all of the measurement columns, separated by factors "Subject" and "Activity" and store in "TidyData" data set.
17. The "TidyData" data set is 180 rows long (for 30 subjects doing 6 activities each) and 68 columns wide where column 1 is "Subject", column 2 is "Activity", and columns 3-68 are the average of each measurments according to each Subject and each Activity.  This completes item 5 in the Course Project description.
18. Write the data to file "TidyData.txt" using function write.table().