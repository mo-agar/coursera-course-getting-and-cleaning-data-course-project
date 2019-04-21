install.packages("data.table")
install.packages("dplyr")
library("data.table")
library("dplyr")

#1. step
#Merges the training and the test sets to create one data set.
#read the test files into R

subject_test <- read.table("subject_test.txt");
X_test <- read.table("X_test.txt");
Y_test <- read.table("y_test.txt");

#read the train files into R
subject_train <- read.table("subject_train.txt");
X_train <- read.table("X_train.txt");
Y_train <- read.table("y_train.txt");

#name the subject_train and subject_test variables/columns
names(subject_train) <- "subjectID";
names(subject_test) <- "subjectID";

#read the feature file, and name the variables in the X_train and X_test feature dataframes
featureNames <- read.table("features.txt");
names(X_train) <- featureNames$V2;
names(X_test) <- featureNames$V2;

#name the variables in the Y_train and Y_test activity dataframes
names(Y_train) <- "activity";
names(Y_test) <- "activity";

#merging the files into a single dataset
train <- cbind(subject_train, Y_train, X_train);
test <- cbind(subject_test, Y_test, X_test);
merged <- rbind(train, test);

#2. step: 
#Extracts only the measurements on the mean and standard deviation for each measurement.
meanstdcols <- grepl("mean\\(\\)", names(merged)) | grepl("std\\(\\)", names(merged))
meanstdcols[1:2] <- TRUE
merged2 <- merged[, meanstdcols]

#3. step:
#Uses descriptive activity names to name the activities in the data set
merged$activity <- factor(merged$activity, labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

#4. step:
#Appropriately labels the data set with descriptive variable names.
names(merged2) <- gsub("Acc", "Accelerator", names(merged2))
names(merged2) <- gsub("Mag", "Magnitude", names(merged2))
names(merged2) <- gsub("Gyro", "Gyroscope", names(merged2))
names(merged2) <- gsub("^t", "time", names(merged2))
names(merged2) <- gsub("^f", "frequency", names(merged2))

#5. Step
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidydata <- merged2 %>%
  +     group_by(subjectID, activity) %>%
  +     summarise_all(funs(mean))
