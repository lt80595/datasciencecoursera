#Read data and label columns

activityLabels <- read.table("activity_labels.txt")
names(activityLabels) <- c("activity.number", "activity.name")
featureLabels <- read.table("features.txt")
names(featureLabels) <- c("feature.number", "feature.name")

subjectTest <- read.table(".\\test\\subject_test.txt")
names(subjectTest) <- "subject"
XTest <- read.table(".\\test\\X_test.txt")
names(XTest) <- featureLabels$feature.name
YTest <- read.table(".\\test\\Y_test.txt")
names(YTest) <- "activity"

subjectTrain <- read.table(".\\train\\subject_train.txt")
names(subjectTrain) <- "subject"
XTrain <- read.table(".\\train\\X_train.txt")
names(XTrain) <- featureLabels$feature.name
YTrain <- read.table(".\\train\\Y_train.txt")
names(YTrain) <- "activity"

#Create Data Frames for both Test and Train Subjects
TestDF <- cbind(subjectTest, YTest, XTest, 
                partition = rep("Test", nrow(XTest)))
TrainDF <- cbind(subjectTrain, YTrain, XTrain, 
                 partition = rep("Train", nrow(XTrain)))

#Merge all data to one data set, AllDF
AllDF <- rbind(TrainDF, TestDF)
######################Part One Complete


#2.Extracts only the measurements on the mean and standard deviation
#for each measurement. mean, std
#Ignore: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, 
# tBodyGyroJerkMean ignored since Mean is capitalized
#Ignore: meanFreq- seperate call because not capitalized

e1 <- grep(pattern = "mean()", names(AllDF), ignore.case = FALSE)
e2 <- grep(pattern = "std()", names(AllDF))
i1 <- grep(pattern = "meanFreq", names(AllDF))

extr <- sort(c(e1, e2))
igno <- i1

#g is vector telling what columns to extract from data set
g <- extr[! extr %in% igno]

# Extract data set of: subject, activity, partition (Test or Train), 
# mean, and std variables only
NewDF <- AllDF[, c(1, 2, 564, g)]
######################Part Two Complete


#3.Uses descriptive activity names to name the activities in the data set
#Change activity numbers to correct names
NewDF$activity <- gsub("1", "WALKING", NewDF$activity)
NewDF$activity <- gsub("2", "WALKING_UPSTAIRS", NewDF$activity)
NewDF$activity <- gsub("3", "WALKING_DOWNSTAIRS", NewDF$activity)
NewDF$activity <- gsub("4", "SITTING", NewDF$activity)
NewDF$activity <- gsub("5", "STANDING", NewDF$activity)
NewDF$activity <- gsub("6", "LAYING", NewDF$activity)
######################Part Three Complete


#4.Appropriately labels the data set, NewDF, with descriptive activity names.
# I understood this to mean "Change the Column names"
# I am using Camel Case for my own readability and removing odd characters

#Capitalize first letters and change first letters t or f
.simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1, 1)), substring(s, 2),
        sep = "", collapse = " ")
}
for(i in 1:length(names(NewDF))) {
  x <- .simpleCap(names(NewDF)[i])
  names(NewDF)[i] <- x
}
names(NewDF) <- gsub("T", "Time", names(NewDF))
names(NewDF) <- gsub("F", "Frequency", names(NewDF))

#Change other names and remove odd characters and repeats
names(NewDF) <- gsub("mean", "Mean", names(NewDF))
names(NewDF) <- gsub("std", "Std", names(NewDF))
names(NewDF) <- gsub("Acc", "Acceleration", names(NewDF))
names(NewDF) <- gsub("Mag", "Magnitude", names(NewDF))
names(NewDF) <- gsub("Gyro", "Gyroscope", names(NewDF))
names(NewDF) <- gsub("BodyBody", "Body", names(NewDF))
names(NewDF) <- gsub("[(),-]", "", names(NewDF))
######################Part Four Complete


#5.Creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject. 

NewDF <- transform(NewDF, Subject = factor(Subject), 
                   Activity = factor(Activity))

library(reshape2)
TMelt <- melt(NewDF, id.vars=c("Subject","Activity"), 
              measure.vars= names(NewDF)[4:69])
TidyData <- dcast(TMelt, Subject + Activity ~ variable, fun.aggregate=mean)
######################Part Five Complete

#TidyData is of dim-[180, 68], where 66 of 68 columns are variable averages,
# column 1- Subject, column 2- Activity


#Write Tidy data frame to text file
write.table(TidyData, file = "TidyData.txt")

#Check that variables were averaged:
#table(TidyData$Subject, TidyData$Activity)




#####Examples & Notes.... Brainstorming for my reference only.......
#names(mydataframe) <- gsub("Mag", "Magnitude", names(mydataframe))
#a <- "tBodyAcc-mean()-X"
# gsub("[(),-]","", a)
#table(NewDF$Subject, NewDF$Activity)
#h <- ddply(BaltNEI, .(year, type), summarize, sum = sum(Emissions))
#write.table(mytidydataframe, file = "tidy.txt")
#t1.melt <- melt(t1,id=c("subject","activity"), measure.vars =????)
#tidyData<-dcast(B, Subject + Activity_Label ~ variable, fun.aggregate=mean)
