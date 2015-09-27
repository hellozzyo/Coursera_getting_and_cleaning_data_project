run_analysis {
  library(data.table)
  
  # Load activity labels + features
  activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  activityLabels[,2] <- as.character(activityLabels[,2])
  features <- read.table("./UCI HAR Dataset/features.txt")
  features[,2] <- as.character(features[,2])
  
  # Extract only the data on mean and standard deviation
  featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
  featuresWanted.names <- features[featuresWanted,2]
  featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
  featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
  featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)
  
  # Load the datasets
  train <- read.table("./UCI HAR Dataset/train/X_train.txt")[featuresWanted]
  trainActivities <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  train <- cbind(trainSubjects, trainActivities, train)
  
  test <- read.table("./UCI HAR Dataset/test/X_test.txt")[featuresWanted]
  testActivities <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  test <- cbind(testSubjects, testActivities, test)
  
  # merge datasets and add labels
  MergedData <- rbind(train, test)
  colnames(MergedData) <- c("subject", "activity", featuresWanted.names)

  # change activity & subject into factors
  MergedData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
  MergedData$subject <- as.factor(allData$subject)
  
  #Average of each activity and each subject
  library(plyr)
  AverageData <- ddply(MergedData, .(subject, activity), function(x) colMeans(x[, 3:81]))
  
  #Create tidy.txt
  write.table(AverageData, "tidy.txt", row.names = FALSE, quote = FALSE)

}