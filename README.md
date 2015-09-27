# Getting and Cleaning Data - A Coursera Project
This is the course project for the Getting and Cleaning Data Coursera course. The objective is to get and clean data from the Human Activity Recognition Using Smartphones Dataset.

# Background
One of the most exciting areas in all of data science is wearable computing. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset used for the project was obtained from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# About run.analysis.R

This code is designed to run properly when the dataset is extracted to the working directory, with subfolders intact. The steps taken to transform the initial data set are as follow:

1. Create one R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Labels the data set with descriptive variable names. 
6. Converts activity and subject columns to factors
7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The final dataset can be found in 'tidy.txt'. A detailed description of the variables can be found in `CodeBook.md`. The basic naming convention is:

  {tOrf}{measurement}{meanOrStd}{XYZ}

Where `tOrf` is either Time or Frequency, indicating whether the measurement comes from the time or frequency domain, `measurement` is one of the original measurement features, `meanOrStd` is either Mean or StdDev, indicating whether the measurement was a mean or standard deviation variable, and `XYZ` is X, Y, or Z, indicating the axis along which the measurement was taken, or nothing, for magnitude measurements.

# About CodeBook.md
This code book summarizes the variables, the data and any data transformation after the data clean up. 
